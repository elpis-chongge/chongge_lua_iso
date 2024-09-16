require("BossDungeonFire_BossBattleWindowByName")
local BossBattleFireWindow = {}
local uis, contentPane, chapterData, curStageData, stageCost, jumpTb, bossSpineName, changeTexture, changeEffect, tween

function BossBattleFireWindow.ReInitData()
end

function BossBattleFireWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BossBattleFireWindow.package, WinResConfig.BossBattleFireWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBossDungeonFire_BossBattleWindowUis(contentPane)
    local chapterId = bridgeObj.argTable[1]
    chapterData = TableData.GetConfig(chapterId, "BaseChapter")
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(chapterData.back_ground)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    BossBattleFireWindow.UpdateInfo()
    BossBattleFireWindow.InitBtn()
    BossBattleFireWindow.UpdateTextDisplay()
    if BossDungeonMgr.playInAnim then
      BossDungeonMgr.playInAnim = nil
      PlayUITrans(uis.root, "in1")
    end
    BossBattleFireWindow.ShowTips()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BOSS_BATTLE_IN)
  end)
end

function BossBattleFireWindow.UpdateTextDisplay()
  local info = uis.Main.Info
  UIUtil.SetBtnText(info.ButtonRegion.Star1Btn, T(966))
  UIUtil.SetBtnText(info.ButtonRegion.Star2Btn, T(966))
  UIUtil.SetBtnText(info.ButtonRegion.DispatchBtn, T(967))
  info.Opinion.WordTxt.text = T(663)
  info.Reward.WordTxt.text = T(970)
  if chapterData and chapterData.name then
    info.Title.Title1Txt.text = chapterData.name()
  end
end

function BossBattleFireWindow.LoadChangeEffect()
  BossBattleFireWindow.ReleaseTexture()
  changeTexture = LuaUtil.GetCameraRenderTexture(UICamera)
  changeEffect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Bosschallenge/FX_ui_boss_changle_listdis.prefab", uis.Main.root:GetChild("EffectHolder"))
  LuaUtil.ChangeBadgeColorProperty(changeEffect, "_DissolutionLineColor", 123, 43, 32, 255, 0)
  if changeTexture and changeEffect then
    if tween then
      LeanTween.cancel(tween.uniqueId)
    end
    tween = LeanTween.delayedCall(0.05, function()
      if uis then
        LuaUtil.ChangeTextureValue(changeEffect, "_MainTex", changeTexture, "Mesh_low_plane")
      end
      tween = nil
    end)
  end
end

function BossBattleFireWindow.ReleaseTexture()
  if changeTexture then
    LuaUtil.ReleaseTexture(changeTexture)
  end
  changeTexture = nil
end

function BossBattleFireWindow.UpdateInfo(notChange)
  bossSpineName = ""
  local list = uis.Main.GradeRegion.GradeList
  local switchTrans = uis.Main.Info.root:GetTransition("switch")
  local allStateData = {}
  if chapterData then
    local openIndex
    
    function list.itemRenderer(i, item)
      local stateData = TableData.GetConfig(chapterData.stages[i + 1], "BaseStage")
      local lock
      if stateData then
        allStateData[stateData.id] = stateData
        UIUtil.SetText(item, stateData.name(), "GradeTxt")
        local lockLv
        if stateData.open_condition then
          local arr = Split(stateData.open_condition, ":")
          lockLv = tonumber(arr[2])
        end
        local lvBol = nil == lockLv and true or lockLv <= ActorData.GetLevel()
        local stageBol = nil == stateData.pre and true or AdventureData.GetStageData(stateData.chapter_id, stateData.pre)
        if lvBol and stageBol then
          openIndex = i
          lock = true
          ChangeUIController(item, "lock", 0)
          UIUtil.SetText(item, T(973, lockLv), "WordTxt")
        else
          if lockLv and lockLv > ActorData.GetLevel() then
            UIUtil.SetText(item, T(972, lockLv), "WordTxt")
          else
            UIUtil.SetText(item, T(969, allStateData[stateData.pre].name()), "WordTxt")
          end
          ChangeUIController(item, "lock", 1)
        end
        item.onClick:Set(function()
          if list.selectedIndex ~= i then
            if lockLv and ActorData.GetLevel() < lockLv then
              FloatTipsUtil.ShowWarnTips(T(1335, lockLv))
              return
            end
            if stateData.pre and not AdventureData.GetStageData(stateData.chapter_id, stateData.pre) then
              FloatTipsUtil.ShowWarnTips(T(229))
              return
            end
            BossBattleFireWindow.LoadChangeEffect()
            switchTrans:ClearHooks()
            list.selectedIndex = i
            switchTrans:SetHook("sign", function()
              BossDungeonMgr.lastStageId = stateData.id
              BossBattleFireWindow.ShowStateInfo(stateData)
            end)
            switchTrans:Play()
            list.touchable = false
            LeanTween.delayedCall(0.65, function()
              if uis then
                list.touchable = true
              end
            end)
          end
        end)
      end
    end
    
    list.numItems = #chapterData.stages
    if openIndex and nil == notChange then
      list.selectedIndex = openIndex
      local openId = chapterData.stages[openIndex + 1]
      BossDungeonMgr.lastStageId = openId
      BossBattleFireWindow.ShowStateInfo(allStateData[openId])
    end
    if openIndex and allStateData and chapterData then
      local stageOpenProgress = chapterData.stages[openIndex + 1]
      if allStateData[stageOpenProgress] and allStateData[stageOpenProgress].pre and not OprRecordUtil.IsAlreadyRecord(PLAYER_OPERATION_ENUM.BOSS_STAGE_OPEN, stageOpenProgress) then
        LeanTween.delayedCall(0.25, function()
          if uis then
            OpenWindow(WinResConfig.BossOpenTipsWindow.name, nil, allStateData[stageOpenProgress].name(), function()
              if uis then
                local item = list:GetChildAt(openIndex)
                if item then
                  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Bosschallenge/FX_ui_boss_changlle_hardunlock.prefab", item:GetChild("CardShowHolder"), nil, true)
                end
                BossBattleFireWindow.LoadChangeEffect()
              end
            end)
            local newData = OprRecordUtil.GetRecord(PLAYER_OPERATION_ENUM.BOSS_STAGE_OPEN)
            table.insert(newData, stageOpenProgress)
            OprRecordUtil.SaveRecord(PLAYER_OPERATION_ENUM.BOSS_STAGE_OPEN, newData)
          end
        end)
      end
    end
  end
end

function BossBattleFireWindow.ShowStateInfo(stateData)
  if stateData then
    curStageData = stateData
    if stateData.back_effect and bossSpineName ~= stateData.back_effect then
      UIUtil.SetEffectToUI(RES_PATH_PREFIX.BOSS_SPINE .. stateData.back_effect, uis.Main.BackGround.BackGroundHolder)
      bossSpineName = stateData.back_effect
    end
    local info = uis.Main.Info
    info.Title.Title2Txt.text = T(971, stateData.name())
    info.Title.Title3Txt.text = stateData.name()
    if stateData.recommend_lv then
      info.Opinion.NumberTxt.text = stateData.recommend_lv()
    end
    if stateData.buff_list then
      local buffData = TableData.GetConfig(stateData.buff_list[1], "BaseSkillBuffPre")
      if buffData then
        info.Buff.NameTxt.text = buffData.name()
        info.Buff.WordTxt.text = buffData.des()
      end
    end
    local itemHand, itemDrops
    itemDrops = GetConfigItemList(stateData.reward_show, true)
    for i = #itemDrops, 1, -1 do
      if 1 == itemDrops[i].type and AdventureData.GetPassedStageInfo(stateData.id) then
        table.remove(itemDrops, i)
      end
    end
    local rewardList = info.Reward.ItemList
    if rewardList.numChildren > 0 then
      rewardList:RemoveChildrenToPool()
    end
    for i, v in ipairs(itemDrops) do
      itemHand = rewardList:AddItemFromPool()
      local itemConfig = TableData.GetConfig(v.value, "BaseBadge")
      if itemConfig then
        local loader = itemHand:GetChild("ItemLoader")
        local suitConfig = TableData.GetConfig(itemConfig.suit_group_id, "BaseBadgeSuitGroup")
        if loader and suitConfig then
          loader.url = UIUtil.GetResUrl(suitConfig.icon)
        end
        ChangeUIController(itemHand, "c1", itemConfig.star - 1)
        ChangeUIController(itemHand, "number", 1)
        loader.onClick:Set(function()
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
          OpenWindow(WinResConfig.BadgeGetTipsWindow.name, nil, v.value)
        end)
      end
    end
    stageCost = GetConfigItemList(stateData.cost, true)
    if stageCost[1] then
      info.ButtonRegion.EnergyLabel.WordTxt.text = "-" .. stageCost[1].value
    end
    if AdventureData.GetPassedStageInfo(stateData.id) and 1 == curStageData.sweep_type then
      ChangeController(info.ButtonRegion.c1Ctr, 1)
    else
      ChangeController(info.ButtonRegion.c1Ctr, 0)
    end
  end
end

function BossBattleFireWindow.ShowTips()
  BossDungeonMgr.InitAssetsTips(uis.Main.AssetsTipsList, {
    COMMON_ITEM_ID.ENERGY
  })
end

function BossBattleFireWindow.StartBattle()
  if curStageData and BossDungeonMgr.SufficientQuantity(curStageData.cost) then
    local CallBack = function()
      local params = {
        sceneType = curStageData.chapter_type,
        stageId = curStageData.id
      }
      ld("Formation", function()
        FormationMgr.TryOpenFormationWindow(params)
      end)
    end
    local max = TableData.GetConfig(70010032, "BaseFixed").int_value
    local allBadge = ActorData.GetAllBadge()
    if max and max <= #allBadge then
      MessageBox.Show(T(974), {
        touchCallback = function()
          if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
            BadgeMgr.OpenBadgeDecompose()
          end
        end
      }, {})
    else
      CallBack()
    end
  end
end

function BossBattleFireWindow.AiBattleOnClick()
  if BossDungeonMgr.SufficientQuantity(curStageData.cost) then
    OpenWindow(WinResConfig.SweepWindow.name, nil, curStageData.id)
  end
end

function BossBattleFireWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.BossBattleFireWindow.name, uis.Main.CurrencyReturn)
  local bigBtn = uis.Main.Info.ButtonRegion.Star2Btn
  bigBtn.onClick:Set(BossBattleFireWindow.StartBattle)
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/BossButtonCutaway/FX_ui_BossButtonCutaway_fire_big.prefab", bigBtn:GetChild("EffectHolder"))
  local centreBtn = uis.Main.Info.ButtonRegion.Star1Btn
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/BossButtonCutaway/FX_ui_BossButtonCutaway_fire_centre.prefab", centreBtn:GetChild("EffectHolder"))
  centreBtn.onClick:Set(BossBattleFireWindow.StartBattle)
  local dispatchBtn = uis.Main.Info.ButtonRegion.DispatchBtn
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/BossButtonCutaway/FX_ui_BossButtonCutaway_fire_small.prefab", dispatchBtn:GetChild("EffectHolder"))
  dispatchBtn.onClick:Set(BossBattleFireWindow.AiBattleOnClick)
end

function BossBattleFireWindow.OnShown()
  if uis then
    BossBattleFireWindow.ShowTips()
    BossBattleFireWindow.UpdateInfo(true)
  end
end

function BossBattleFireWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  chapterData = nil
  curStageData = nil
  stageCost = nil
  bossSpineName = nil
  changeEffect = nil
  BossBattleFireWindow.ReleaseTexture()
end

return BossBattleFireWindow
