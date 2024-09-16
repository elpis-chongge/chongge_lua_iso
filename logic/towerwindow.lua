require("Tower_TowerWindowByName")
local TowerWindow = {}
local contain = table.contain
local uis, contentPane, chapterData, jumpTb, towerMapData, sceneInfo, curBgPath, firstEnter

function TowerWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TowerWindow.package, WinResConfig.TowerWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetTower_TowerWindowUis(contentPane)
    local mapId = bridgeObj.argTable[1]
    towerMapData = TableData.GetConfig(mapId, "BaseTowerMap")
    UIUtil.SetHolderCenter(uis.Main.Scene.BackGround.BackGroundHolder)
    firstEnter = true
    TowerWindow.InitBtn()
    TowerWindow.GetChaptersInfo()
  end)
end

function TowerWindow.GetChaptersInfo(callBack)
  AdventureService.GetChapterStageReq(towerMapData.chapter_id, function()
    TowerWindow.UpdateInfo()
    if callBack then
      callBack()
    end
    if sceneInfo then
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.TOWER_CHAPTER_OPEN, sceneInfo.currentChapter)
    end
  end)
end

function TowerWindow.CheckTips()
  local endChapter = towerMapData.chapter_id[#towerMapData.chapter_id]
  if endChapter < sceneInfo.currentChapter then
    local endChapterData = TableData.GetConfig(endChapter, "BaseChapter")
    if endChapterData and endChapterData.next > 0 then
      local endStageId = endChapterData.stages[#endChapterData.stages]
      local nextChapterData = TableData.GetConfig(endChapterData.next, "BaseChapter")
      if nextChapterData then
        local startStageId = nextChapterData.stages[1]
        if startStageId == sceneInfo.currentStage then
          local nextMapData = TableData.GetConfig(towerMapData.next, "BaseTowerMap")
          if nextMapData then
            local txt = T(1298, towerMapData.name1(), nextMapData.name1())
            TowerWindow.OpenTips(txt, function()
              towerMapData = nextMapData
              TowerWindow.GetChaptersInfo(function()
                UIMgr:SetWindowArgs(WinResConfig.TowerWindow.name, {
                  towerMapData.id
                })
                ChangeController(uis.Main.c1Ctr, 0)
              end)
            end)
          end
        end
      end
    end
  elseif endChapter == sceneInfo.currentChapter and 0 == sceneInfo.currentStage then
    local endChapterData = TableData.GetConfig(endChapter, "BaseChapter")
    if endChapterData and endChapterData.next and endChapterData.next > 0 then
      local lockLv = TowerWindow.GetOpenConditionLv(endChapterData.next)
      if lockLv then
        local nextMapData = TableData.GetConfig(towerMapData.next, "BaseTowerMap")
        if nextMapData then
          local txt = T(1299, towerMapData.name1(), nextMapData.name1(), lockLv)
          TowerWindow.OpenTips(txt)
        end
      end
    end
  end
end

function TowerWindow.GetOpenConditionLv(chapterId)
  local tempData = TableData.GetConfig(chapterId, "BaseChapter")
  if tempData and tempData.open_condition then
    local arr = Split(tempData.open_condition, "|")
    for i = 1, #arr do
      local condition = Split(arr[i], ":")
      if 2 == #condition then
        local id = tonumber(condition[1])
        if CONDITION_ENUM.LV == id then
          local lv = tonumber(condition[2])
          if lv > ActorData.GetLevel() then
            return lv
          end
        end
      end
    end
  end
end

function TowerWindow.OpenTips(txt, jumpFun)
  uis.Main.LockTips.WordTxt.text = txt
  if jumpFun then
    uis.Main.LockTips.GotoBtn.onClick:Set(function()
      jumpFun()
    end)
    UIUtil.SetText(uis.Main.LockTips.GotoBtn, T(1301), "WordTxt")
    ChangeController(uis.Main.LockTips.c1Ctr, 1)
  else
    uis.Main.LockTips.GotoBtn.onClick:Clear()
    ChangeController(uis.Main.LockTips.c1Ctr, 0)
  end
  ChangeController(uis.Main.c1Ctr, 1)
end

function TowerWindow.UpdateInfo()
  curBgPath = nil
  sceneInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
  local lastBtn
  local isCurChapter = table.contain(towerMapData.chapter_id, sceneInfo.currentChapter)
  for i = 1, 5 do
    local btn = uis.Main.BattleList[string.format("Checkpoint%dBtn", i)]
    local type = 0
    if towerMapData.chapter_id[i] < sceneInfo.currentChapter then
      type = 2
      ChangeUIController(btn, "c1", 2)
    elseif towerMapData.chapter_id[i] == sceneInfo.currentChapter then
      type = 1
      ChangeUIController(btn, "c1", 1)
    else
      type = 0
      ChangeUIController(btn, "c1", 0)
    end
    local data = TableData.GetConfig(towerMapData.chapter_id[i], "BaseChapter")
    if data then
      btn:GetChild("PicLoader").url = UIUtil.GetResUrl(data.icon)
      if 1 == type and 0 == sceneInfo.currentStage and data.next and data.next > 0 then
        local lockLv = TowerWindow.GetOpenConditionLv(data.next)
        if lockLv then
          local nextChapterData = TableData.GetConfig(data.next, "BaseChapter")
          if nextChapterData then
            local name = towerMapData.name1()
            local txt = T(1300, name, data.rate_name(), name, nextChapterData.rate_name(), lockLv)
            TowerWindow.OpenTips(txt)
          end
        end
      end
    end
    btn.onClick:Set(function()
      if 0 == type then
        return
      end
      if lastBtn then
        if btn == lastBtn then
          return
        end
        ChangeUIController(lastBtn, "c1", 2)
      end
      chapterData = data
      UIUtil.SetText(btn:GetChild("CheckpointNumber"), chapterData.rate_name(), "NumberTxt")
      TowerWindow.ShowStageInfo()
      ChangeUIController(btn, "c1", 1)
      lastBtn = btn
    end)
    if isCurChapter then
      if towerMapData.chapter_id[i] == sceneInfo.currentChapter then
        btn.onClick:Call()
      end
    elseif 5 == i then
      btn.onClick:Call()
    end
  end
  PlayUITrans(uis.Main.BattleList.root, "in")
  TowerWindow.CheckTips()
  TowerWindow.InitChapterReward()
end

function TowerWindow.ShowStageInfo()
  if chapterData.back_ground and curBgPath ~= chapterData.back_ground then
    UIUtil.SetEffectToUI(string.format("Assets/Art/Effects/Prefab/UI_prefab/pata/%s", chapterData.back_ground), uis.Main.Scene.BackGround.BackGroundHolder)
    curBgPath = chapterData.back_ground
  end
  local trans = uis.Main.Scene.root:GetTransition("Switch")
  if trans then
    if firstEnter then
      TowerWindow.LoadStageInfo(chapterData)
    else
      trans:SetHook("sign", function()
        TowerWindow.LoadStageInfo(chapterData)
      end)
      trans:Play()
    end
  end
end

function TowerWindow.LoadStageInfo(data)
  local path = Split(data.map_path, ":")
  if path and 2 == #path then
    for i = 1, uis.Main.Scene.MapList.numItems do
      uis.Main.Scene.MapList:RemoveChildAt(0, true)
    end
    local map = UIMgr:CreateComponent(path[1], path[2])
    uis.Main.Scene.MapList:AddChild(map)
    for i = 1, #data.stages do
      local stateBtn = map:GetChild(string.format("Point%dBtn", i))
      if stateBtn then
        local battlePoint = stateBtn:GetChild("BattlePoint")
        local stateData = TableData.GetConfig(data.stages[i], "BaseStage")
        if battlePoint and stateData then
          UIUtil.SetText(battlePoint, stateData.name_detail(), "NumberTxt")
          UIUtil.SetText(battlePoint, stateData.name(), "IDTxt")
          UIUtil.SetText(battlePoint, stateData.name(), "IDLockTxt")
          UIUtil.SetText(battlePoint, stateData.name_english(), "SubtitleTxt")
          UIUtil.SetText(battlePoint:GetChild("BattlePointLock"), T(1044))
          battlePoint:GetChild("PicLoader").url = UIUtil.GetResUrl(stateData.icon)
          local type = 0
          if stateData.id < sceneInfo.currentStage or data.id <= sceneInfo.currentChapter and 0 == sceneInfo.currentStage then
            ChangeUIController(battlePoint, "c1", 2)
            type = 3
            ChangeUIController(battlePoint, "c2", 0)
          elseif stateData.id == sceneInfo.currentStage then
            ChangeUIController(battlePoint, "c1", AdventureData.GetPassedStageInfo(stateData.id) and 2 or 1)
            type = 2
            ChangeUIController(battlePoint, "c2", 1)
            UIUtil.SetText(battlePoint:GetChild("BattlePointDot"), T(1302), "WordTxt")
            UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/pata/FX_pata_icon_light.prefab", battlePoint:GetChild("EffectHolder"))
          else
            ChangeUIController(battlePoint, "c2", 0)
            ChangeUIController(battlePoint, "c1", 0)
          end
          stateBtn.onClick:Set(function()
            if 3 == type then
              FloatTipsUtil.ShowWarnTips(T(851))
              return
            end
            if 0 == type then
              FloatTipsUtil.ShowWarnTips(T(229))
              return
            end
            if 2 == type then
              TowerWindow.ItemClick(stateData)
            end
          end)
          if firstEnter then
            battlePoint.alpha = 0
            stateBtn.touchable = false
            PlayUITrans(stateBtn, "up", function()
              if battlePoint and not battlePoint.isDisposed then
                battlePoint.alpha = 1
                stateBtn.touchable = true
              end
            end, i * 0.05)
          end
          SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.TOWER_REEL_SET)
        end
      end
    end
  end
  firstEnter = nil
end

function TowerWindow.ItemClick(data)
  OpenWindow(WinResConfig.DungeonInfoWindow.name, nil, {
    stageId = data.id
  })
end

function TowerWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.TowerWindow.name, uis.Main.CurrencyReturn)
  uis.Main.RewardBtn.onClick:Set(function()
    OpenWindow(WinResConfig.TowerRewardWindow.name)
  end)
end

function TowerWindow.InitChapterReward()
  local screenInfo = AdventureData.GetSceneData(ProtoEnum.SCENE_TYPE.CLIMB_TOWER)
  if screenInfo then
    local chapterId = screenInfo.rewardedChapter
    local nextChapterId = AdventureMgr.GetTowerNextChapterId(chapterId)
    nextChapterId = nextChapterId >= screenInfo.currentChapter and screenInfo.currentChapter or nextChapterId
    local data = TableData.GetConfig(nextChapterId, "BaseChapter")
    local rewardId = data.chapter_reward_stage
    if data and rewardId then
      uis.Main.RewardBtn.onClick:Set(function()
        OpenWindow(WinResConfig.TowerRewardWindow.name)
      end)
      local red = uis.Main.RewardBtn:GetChild("Red")
      if red then
        if nextChapterId > screenInfo.rewardedChapter then
          if rewardId < screenInfo.currentStage or 0 == screenInfo.currentStage then
            red.visible = true
          else
            red.visible = false
          end
        else
          red.visible = false
        end
      end
    end
  end
end

function TowerWindow.OnShown()
  if uis then
    TowerWindow.InitChapterReward()
  end
end

function TowerWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Adventure.GET_STAGE_DATA then
    TowerWindow.UpdateInfo()
  end
end

function TowerWindow.OnClose()
  uis = nil
  contentPane = nil
  chapterData = nil
  sceneInfo = nil
  towerMapData = nil
  curBgPath = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return TowerWindow
