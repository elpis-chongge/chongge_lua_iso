require("Message_SweepWindowByName")
local SweepWindow = {}
local uis, contentPane

function SweepWindow.ReInitData()
end

local stageId, stageConfig, stageCost, canClose
local isSweeping = false
local stopWhenItemEnough = false
local delayTime = 0.2
local curLevel
local maxSweepOnce = 5

function SweepWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.SweepWindow.package, WinResConfig.SweepWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_SweepWindowUis(contentPane)
    ld("Sweep")
    canClose = false
    stageId = bridgeObj.argTable[1]
    stageConfig = TableData.GetConfig(stageId, "BaseStage")
    SweepWindow.UpdateInfo(true)
    SweepWindow.InitBtn()
    SweepWindow.SetSweepState(false)
  end)
end

function SweepWindow.UpdateInfo(isInit)
  SweepWindow.UpdateStageInfo(isInit)
  SweepWindow.UpdateReason(isInit)
  SweepWindow.UpdateFallInfo(isInit)
  SweepWindow.UpdateSweepResult()
  SweepWindow.UpdateSweepBtn()
  SweepWindow.UpdateTips()
end

function SweepWindow.UpdateStageInfo(isInit)
  if isInit then
    local name = stageConfig.name_detail and stageConfig.name_detail()
    if nil == name then
      name = stageConfig.name and stageConfig.name()
    end
    uis.Main.SweepTips.NameTxt.text = name or ""
  end
end

function SweepWindow.UpdateReason(isInit)
  local btn = uis.Main.SweepTips.ReasonBtn
  if isInit then
    btn.onClick:Set(function()
      ld("Energy", function()
        EnergyService.GetEnergyRecoverInfoReq()
      end)
    end)
  end
  local numberTxt = btn:GetChild("NumberTxt")
  local energy = ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY)
  local maxEnergy = ActorData.GetEnergyMax()
  numberTxt.text = T(11308, energy, maxEnergy)
end

function SweepWindow.UpdateFallInfo(isInit)
  local fromCardId = SweepData.GetFromCardId(stageId)
  if isInit then
    if fromCardId then
      uis.Main.SweepTips.c1Ctr.selectedIndex = 0
      local sweepCard = uis.Main.SweepTips.SweepCard
      local cardData = CardData.GetCardDataById(fromCardId)
      if cardData then
        UIUtil.SetHeadByFaceId(cardData.fashionId, sweepCard.SweepCardBg.PicLoader, HEAD_ICON_TYPE_ENUM.BANNER)
      end
      local sweepCardItemInfo = uis.Main.SweepTips.SweepCard.SweepCardItem
      local itemId = SweepData.GetItemId(stageId)
      UIUtil.ShowItemFrame(itemId, sweepCardItemInfo.Item.root, nil, nil, function()
        SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
        local type = TableData.GetTupleTypeById(itemId)
        UIUtil.OpenPreviewTips(itemId, type, nil, true)
      end)
      sweepCardItemInfo.Item.numberCtr.selectedIndex = 1
    else
      uis.Main.SweepTips.c1Ctr.selectedIndex = 1
      local sweepFall = uis.Main.SweepTips.SweepFall
      sweepFall.WordTxt.text = T(11303)
      local itemHand
      local itemDrops = GetStageRewardShow(stageConfig.reward_show, true)
      local tipsWord = {
        T(676),
        T(703),
        T(704)
      }
      for i = #itemDrops, 1, -1 do
        if 1 == itemDrops[i].type then
          table.remove(itemDrops, i)
        end
      end
      local list = sweepFall.ItemList
      list:RemoveChildrenToPool()
      for i, v in ipairs(itemDrops) do
        itemHand = list:AddItemFromPool()
        if 3 == v.type then
          local itemConfig = TableData.GetConfig(v.id, "BaseBadge")
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
              OpenWindow(WinResConfig.BadgeGetTipsWindow.name, nil, v.id)
            end)
          end
        else
          if v.tipsType then
            UIUtil.SetText(itemHand, tipsWord[v.tipsType], "WordTxt")
            ChangeUIController(itemHand, "c2", 0)
          else
            ChangeUIController(itemHand, "c2", 1)
          end
          ChangeUIController(itemHand, "number", 1)
          UIUtil.ShowItemFrame(v.id, itemHand, nil, nil, function()
            SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.COMMON_CLICK)
            UIUtil.OpenPreviewTips(v.id, v.itemType, nil, true)
          end)
          ChangeUIController(itemHand, "c3", 0)
        end
      end
    end
  end
  if fromCardId then
    local sweepCardItemInfo = uis.Main.SweepTips.SweepCard.SweepCardItem
    sweepCardItemInfo.WordTxt.text = T(11300)
    local gotCount = SweepData.GetItemGotCount(stageId)
    local needCount = SweepData.GetTargetItemCount(stageId)
    if gotCount >= needCount then
      sweepCardItemInfo.NumberTxt.text = T(11306, gotCount, needCount)
    else
      sweepCardItemInfo.NumberTxt.text = T(11301, gotCount, needCount)
    end
  end
end

function SweepWindow.UpdateSweepResult(rewards)
  local result = SweepData.GetSweepResult()
  if rewards then
    uis.Main.SweepTips.c2Ctr.selectedIndex = 1
  else
    uis.Main.SweepTips.c2Ctr.selectedIndex = 0
  end
  if rewards then
    local list = uis.Main.SweepTips.SweepResultList.ResultList
    local hand = list:AddItemFromPool()
    if hand then
      SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.DISPATCH_GET_ITEM)
      PlayUITrans(hand, "up")
      local resultCom = hand:GetChild("SweepResult")
      local numberTxt = resultCom:GetChild("NumberTxt")
      if numberTxt then
        numberTxt.text = string.format("%02d", list.numChildren)
      end
      local wordTxt = resultCom:GetChild("WordTxt")
      if wordTxt then
        wordTxt.text = T(11305)
      end
      local itemList = resultCom:GetChild("ItemList")
      if itemList then
        itemList:RemoveChildrenToPool()
        
        function itemList.itemRenderer(i, gcmp)
          local reward = rewards[i + 1]
          UIUtil.ShowItemFrame(reward.itemId, gcmp, reward.count, nil, function()
            UIUtil.CommonItemClickCallback(reward.itemId, reward.tupleType, reward.uid, true)
          end)
          local fromCardId = SweepData.GetFromCardId(stageId)
          if fromCardId then
            local targetItemId = SweepData.GetItemId(stageId)
            if reward.itemId == targetItemId then
              ChangeUIController(gcmp, "sweep", 1)
              gcmp:GetChild("ItemSweep"):GetChild("TimeTxt").text = T(11307)
            end
          end
        end
        
        itemList.numItems = #rewards
      end
      local effectHolder = resultCom:GetChild("EffectHolder")
      if effectHolder then
        UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_10lian.prefab", effectHolder, nil, true)
      end
      list:ScrollToView(list.numChildren - 1, true)
    end
  end
end

function SweepWindow.UpdateSweepBtn()
  local arr = GetConfigItemList(stageConfig.cost)
  stageCost = arr[COMMON_ITEM_ID.ENERGY].value
  local sweep1 = uis.Main.SweepTips.Sweep1Region
  UIUtil.SetBtnText(sweep1.SweepBtn, T(11304))
  sweep1.ReasonSpend.NumberTxt.text = T(678, stageCost)
  sweep1.SweepBtn.data = 1
  sweep1.SweepBtn.onClick:Add(SweepWindow.ClickSweepBtn)
  local sweep10 = uis.Main.SweepTips.Sweep10Region
  UIUtil.SetBtnText(sweep10.SweepBtn, T(11304))
  sweep10.ReasonSpend.NumberTxt.text = T(678, stageCost * maxSweepOnce)
  sweep10.SweepBtn.data = maxSweepOnce
  sweep10.SweepBtn.onClick:Add(SweepWindow.ClickSweepBtn)
end

function SweepWindow.ClickSweepBtn(eventContext)
  if true == isSweeping then
    return
  end
  local sweepCount = eventContext.sender.data
  local energy = ActorData.GetItemCount(COMMON_ITEM_ID.ENERGY)
  if 1 == sweepCount then
    if energy >= stageCost then
      SweepWindow.StartSweep(sweepCount)
    else
      ld("Energy", function()
        EnergyService.GetEnergyRecoverInfoReq()
      end)
    end
  elseif sweepCount == maxSweepOnce then
    local canSweepMax = math.min(math.floor(energy / stageCost), sweepCount)
    if 0 == canSweepMax then
      ld("Energy", function()
        EnergyService.GetEnergyRecoverInfoReq()
      end)
    else
      SweepWindow.StartSweep(canSweepMax)
    end
  end
end

function SweepWindow.UpdateTips()
  local fromCardId = SweepData.GetFromCardId(stageId)
  if fromCardId then
    local tips = uis.Main.SweepTips.SweepWord
    tips.WordTxt.text = T(11302)
  end
end

function SweepWindow.SetSweepState(sweeping)
  isSweeping = sweeping
  if isSweeping then
    uis.Main.SweepTips.c3Ctr.selectedIndex = 1
  else
    uis.Main.SweepTips.c3Ctr.selectedIndex = 0
  end
end

function SweepWindow.StartSweep(count)
  curLevel = ActorData.GetLevel()
  SweepData.InitSweepRecord({
    stageId = stageId,
    sweepMaxCount = count,
    curSweepCount = 0,
    cachedSweepResult = {}
  })
  if count > 1 then
    if SweepData.sweepTarget then
      local gotCount = SweepData.GetItemGotCount(stageId)
      local targetCount = SweepData.GetTargetItemCount(stageId)
      if gotCount and targetCount and gotCount < targetCount then
        stopWhenItemEnough = true
      else
        stopWhenItemEnough = false
      end
    end
    SweepWindow.SetSweepState(true)
  end
  SweepWindow.SendSweepStage(stageId)
end

function SweepWindow.EachSweepComplete(result)
  local sweepRecord = SweepData.sweepRecord
  if nil == sweepRecord then
    return
  end
  table.sort(result.rewards, SweepWindow.Sort)
  if sweepRecord.cachedSweepResult then
    table.insert(sweepRecord.cachedSweepResult, result.rewards)
  else
    sweepRecord.cachedSweepResult = {
      result.rewards
    }
  end
  SweepData.UpdateItemGotCount(result.rewards)
  SweepWindow.UpdateSweepResult(result.rewards)
  SweepWindow.UpdateFallInfo()
  local needStop = false
  if result.level > curLevel then
    needStop = true
    local closeFun = function()
      SoundUtil.PlayLastMusic()
      ld("Guide")
      if GuideMgr.guideBol == true then
        if UIMgr:IsWindowHide(WinResConfig.DungeonInfoWindow.name) or UIMgr:IsWindowOpen(WinResConfig.DungeonInfoWindow.name) then
          UIMgr:CloseWindow(WinResConfig.SweepWindow.name, true, true, false)
          UIMgr:CloseWindow(WinResConfig.DungeonInfoWindow.name)
        else
          UIMgr:CloseWindow(WinResConfig.SweepWindow.name, true, false, false)
        end
      end
    end
    UIMgr.tempWindowForceHideBlow = WinResConfig.LevelUpWindow.name
    OpenWindow(WinResConfig.LevelUpWindow.name, nil, closeFun, curLevel)
  end
  curLevel = result.level
  sweepRecord.curSweepCount = sweepRecord.curSweepCount + 1
  if needStop or sweepRecord.curSweepCount >= sweepRecord.sweepMaxCount then
    SweepWindow.StopSweep()
  else
    if SweepData.sweepTarget and stopWhenItemEnough and SweepData.GetItemGotCount(stageId) >= SweepData.GetTargetItemCount(stageId) then
      SweepWindow.StopSweep()
      return
    end
    LeanTween.delayedCall(delayTime, function()
      SweepWindow.SendSweepStage(stageId)
    end)
  end
end

function SweepWindow.SendSweepStage(stageId)
  local badgeType = {
    ProtoEnum.SCENE_TYPE.BOSS_WATER,
    ProtoEnum.SCENE_TYPE.BOSS_FIRE,
    ProtoEnum.SCENE_TYPE.BOSS_WOOD,
    ProtoEnum.SCENE_TYPE.BOSS_LIGHT,
    ProtoEnum.SCENE_TYPE.BOSS_DARK
  }
  local stageData = TableData.GetConfig(stageId, "BaseStage")
  if stageData and stageData.chapter_id then
    local chapterData = TableData.GetConfig(stageData.chapter_id, "BaseChapter")
    if chapterData and chapterData.type then
      if table.contain(badgeType, chapterData.type) then
        local max = TableData.GetConfig(70010032, "BaseFixed").int_value
        local allBadge = ActorData.GetAllBadge()
        if max and max <= #allBadge then
          SweepWindow.StopSweep()
          MessageBox.Show(T(974), {
            touchCallback = function()
              if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.HOME_BADGE) then
                BadgeMgr.OpenBadgeDecompose()
              end
            end
          }, {})
        else
          SweepService.SweepStageReq(stageId)
        end
      else
        SweepService.SweepStageReq(stageId)
      end
    end
  end
end

function SweepWindow.Sort(a, b)
  if a.tupleType == ProtoEnum.TUPLE_TYPE.BADGE and b.tupleType == ProtoEnum.TUPLE_TYPE.BADGE then
    local dataA = TableData.GetConfig(a.itemId, "BaseBadge")
    local dataB = TableData.GetConfig(b.itemId, "BaseBadge")
    if dataA and dataB then
      if dataB.star == dataA.star then
        return a.itemId > b.itemId
      else
        return dataA.star > dataB.star
      end
    end
  end
  return false
end

function SweepWindow.StopSweep()
  SweepWindow.SetSweepState(false)
end

function SweepWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(SweepWindow.TouchClose)
end

function SweepWindow.TouchClose()
  if false == canClose then
    return
  end
  if true == isSweeping then
    return
  end
  UIMgr:CloseWindow(WinResConfig.SweepWindow.name)
end

function SweepWindow.OnShowAnimationEnd()
  canClose = true
end

function SweepWindow.OnClose()
  isSweeping = false
  stageId = nil
  stageConfig = nil
  curLevel = nil
  uis = nil
  contentPane = nil
end

function SweepWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.SweepWindow.SWEEP_RESULT then
    SweepWindow.EachSweepComplete(para)
  elseif msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    SweepWindow.UpdateReason()
  end
end

return SweepWindow
