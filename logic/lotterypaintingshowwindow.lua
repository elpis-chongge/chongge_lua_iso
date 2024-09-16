require("LotteryCardShow_PaintingShowWindowByName")
local LotteryPaintingShowWindow = {}
local uis, contentPane, rewardData, index, tipsArr, curNum, curTypingEffect, curSoundEventIns, closeCallback, notShowResultWindow, notShowChangeItem
local closeTouchable = false

function LotteryPaintingShowWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.LotteryPaintingShowWindow.package, WinResConfig.LotteryPaintingShowWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetLotteryCardShow_PaintingShowWindowUis(contentPane)
    rewardData = bridgeObj.argTable[1]
    closeCallback = bridgeObj.argTable[2]
    notShowResultWindow = bridgeObj.argTable[3]
    notShowChangeItem = bridgeObj.argTable[4]
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_SUMMON)
    index = 0
    curNum = 0
    tipsArr = {}
    LotteryPaintingShowWindow.InitBtn()
    LotteryEffect.CloseLotteryScene()
    LotteryPaintingShowWindow.Next()
  end)
end

local backgroundPathList = {
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/FX_ui_gachaend_show_green.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/FX_ui_gachaend_show_blue.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/FX_ui_gachaend_show_purple.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/FX_ui_gachaend_show_yellow.prefab",
  "Assets/Art/Effects/Prefab/UI_prefab/Gachaendshow/FX_ui_gachaend_show_orange.prefab"
}

function LotteryPaintingShowWindow.Init()
  if nil == uis then
    return
  end
  LotteryEffect.CloseCardEffect()
  local reward = rewardData[index]
  local data = TableData.GetConfig(reward.item.itemId, "BaseCard")
  tipsArr = {}
  if reward.changeItem and #reward.changeItem > 0 then
    local itemArr = LotteryPaintingShowWindow.GetItemArr(data, reward)
    for i, v in ipairs(itemArr.arr) do
      local t = {}
      t.wordId = itemArr.wordId
      t.arr = v
      table.insert(tipsArr, t)
    end
  end
  LotteryPaintingShowWindow.HideTips()
  contentPane.visible = true
  closeTouchable = true
  local trans = uis.Main.root:GetTransition("in")
  if trans then
    trans:SetHook("Sign", LotteryPaintingShowWindow.UpdateTips)
    trans:Play()
  end
  uis.Main.c1Ctr.selectedIndex = reward.isNew and 0 or 1
  local holder = uis.Main.BackGround.BackGroundHolder
  holder:SetPivot(0.5, 0.5, true)
  holder:Center()
  UIUtil.SetEffectToUI(backgroundPathList[data.star], holder)
  local headData = TableData.GetConfig(data.fashion_id, "BaseFashion")
  if headData then
    UIUtil.SetCardShowSpineAutoAlpha(data.fashion_id, uis.Main.Pic.CardShowLoader, uis.Main.Pic.CardShowHolder, nil, nil, 0.3)
    uis.Main.CardTips.NameTxt.text = data.name()
    ChangeController(uis.Main.Occupation.c1Ctr, data.type - 1)
    ChangeController(uis.Main.Occupation.c2Ctr, 1)
    ChangeController(uis.Main.CardTips.c1Ctr, data.star - 1)
    UIUtil.ShowElementList(uis.Main.CardTips.ElementList, data)
    PlayUITrans(uis.Main.CardTips.root, "up")
    
    function uis.Main.CardTips.StarList.itemRenderer()
    end
    
    uis.Main.CardTips.StarList.numItems = data.star
    LotteryPaintingShowWindow.StopTalk()
    curTypingEffect, curSoundEventIns = UIUtil.ShowTalkWord(data.fashion_id, BUBBLE_TYPE_ENUM.UNLOCK, {
      wordTxt = uis.Main.Dialogue.WordTxt,
      interval = 0.03
    }, true)
  end
  if 1 == #rewardData and LotteryData.showReview then
    LotteryMgr.ShowReview()
    LotteryData.showReview = false
  end
end

function LotteryPaintingShowWindow.StopTalk()
  if curTypingEffect then
    curTypingEffect:Cancel()
    curTypingEffect = nil
  end
  if curSoundEventIns then
    SoundUtil.StopSoundEvent(curSoundEventIns)
    curSoundEventIns = nil
  end
end

function LotteryPaintingShowWindow.HideTips()
  local list = uis.Main.TipsList
  local item
  for i = 0, list.numChildren - 1 do
    item = list:GetChildAt(i)
    item.alpha = 0
  end
end

function LotteryPaintingShowWindow.UpdateTips()
  if tipsArr then
    uis.Main.TipsList.itemRenderer = LotteryPaintingShowWindow.CreateTips
    uis.Main.TipsList.numItems = #tipsArr
  end
end

function LotteryPaintingShowWindow.CreateTips(i, item)
  local arr = tipsArr[i + 1]
  if arr then
    item:GetChild("NameTxt").text = 0 == uis.Main.c1Ctr.selectedIndex and T(513) or T(514)
    local data = TableData.GetConfig(arr.arr.itemId, "BaseItem")
    if data then
      item:GetChild("ItemLoader").url = UIUtil.GetResUrl(data.icon)
      item:GetChild("WordTxt").text = T(515, data.name(), arr.arr.count)
    end
    item.alpha = 0
    PlayUITrans(item, "up", nil, i * 0.1)
  end
end

function LotteryPaintingShowWindow.GetItemArr(data, drop)
  local itemArr = {}
  itemArr.arr = drop.changeItem
  if drop.isNew then
    itemArr.wordId = 513
  else
    itemArr.wordId = 514
  end
  return itemArr
end

function LotteryPaintingShowWindow.Next(showIndex)
  index = showIndex or index + 1
  contentPane.visible = false
  LotteryEffect.PlayCardEffect(rewardData[index].item, function()
    LotteryPaintingShowWindow.Init()
  end)
end

function LotteryPaintingShowWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    if false == closeTouchable then
      return
    end
    closeTouchable = false
    uis.Main.Pic.CardShowHolder:SetNativeObject(nil)
    RTManager:ReleaseModelFromLoader(uis.Main.Pic.CardShowLoader)
    if index >= #rewardData then
      if notShowResultWindow then
        if type(closeCallback) == "function" then
          closeCallback()
        end
        closeCallback = nil
        UIMgr:CloseWindow(WinResConfig.LotteryPaintingShowWindow.name)
        return
      end
      if 10 == #rewardData then
        OpenWindow(WinResConfig.LotteryResultWindow.name, nil, rewardData)
      else
        UIMgr:SendWindowMessage(WinResConfig.LotteryWindow.name, WindowMsgEnum.LotteryWindow.SHOW)
        if not notShowChangeItem then
          local items = GetItemTips.GetCardChangeItem(rewardData)
          if #items > 0 then
            OpenWindow(WinResConfig.GetItemTipsWindow.name, nil, items, nil, closeCallback)
            closeCallback = nil
          end
        end
      end
      UIMgr:CloseWindow(WinResConfig.LotteryPaintingShowWindow.name)
    else
      LotteryPaintingShowWindow.Next()
    end
  end)
  UIUtil.SetText(uis.Main.SkipBtn, T(922))
  uis.Main.SkipBtn.onClick:Set(LotteryPaintingShowWindow.TouchSkip)
  uis.Main.SkipBtn.visible = #rewardData > 1 and index < #rewardData
end

function LotteryPaintingShowWindow.TouchSkip()
  if notShowResultWindow then
    local needShowIndex
    for i = index + 1, #rewardData do
      local reward = rewardData[i]
      if reward.isNew then
        needShowIndex = i
        break
      end
    end
    if needShowIndex then
      uis.Main.Pic.CardShowHolder:SetNativeObject(nil)
      RTManager:ReleaseModelFromLoader(uis.Main.Pic.CardShowLoader)
      LotteryPaintingShowWindow.Next(needShowIndex)
    else
      if type(closeCallback) == "function" then
        closeCallback()
      end
      closeCallback = nil
      UIMgr:CloseWindow(WinResConfig.LotteryPaintingShowWindow.name)
    end
  else
    local needShowIndex
    for i = index + 1, #rewardData do
      local reward = rewardData[i]
      local data = TableData.GetConfig(reward.item.itemId, "BaseCard")
      if data and (reward.isNew or data.star >= 5) and data.star >= 4 then
        needShowIndex = i
        break
      end
    end
    if needShowIndex then
      uis.Main.Pic.CardShowHolder:SetNativeObject(nil)
      RTManager:ReleaseModelFromLoader(uis.Main.Pic.CardShowLoader)
      LotteryPaintingShowWindow.Next(needShowIndex)
    else
      OpenWindow(WinResConfig.LotteryResultWindow.name, nil, rewardData)
      UIMgr:CloseWindow(WinResConfig.LotteryPaintingShowWindow.name)
    end
  end
end

function LotteryPaintingShowWindow.HandleMessage(msgId, para)
end

function LotteryPaintingShowWindow.OnClose()
  if uis then
    uis.Main.Pic.CardShowHolder:SetNativeObject(nil)
    RTManager:ReleaseModelFromLoader(uis.Main.Pic.CardShowLoader)
  end
  LotteryPaintingShowWindow.StopTalk()
  tipsArr = nil
  uis = nil
  contentPane = nil
  rewardData = nil
  index = nil
  curNum = nil
  if type(closeCallback) == "function" then
    closeCallback()
  end
  closeCallback = nil
  notShowResultWindow = nil
  notShowChangeItem = nil
  closeTouchable = false
end

return LotteryPaintingShowWindow
