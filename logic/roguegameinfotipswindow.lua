require("RogueBuild01_InsideSmallWindowByName")
local RogueGameInfoTipsWindow = {}
local uis, contentPane, notifyCollector
local notifyCnt = 0
local notifyDelay = 0
local interval = 0.15
local PopupNotify
local TransitionCallback = function()
  notifyCnt = notifyCnt - 1
  notifyDelay = math.max(notifyDelay - interval, 0)
  if notifyCnt <= 0 then
    UIMgr:CloseWindow(WinResConfig.RogueGameInfoTipsWindow.name)
  end
end
local UpdateCallback = function()
end
local DisplayNotify = function(n_type, items, controllerIndex, delay)
  notifyCnt = notifyCnt + 1
  delay = delay or notifyDelay
  local tipslist = uis.Main.TipsList
  for i, v in ipairs(items) do
    local gcmp = UIMgr:CreateObject("RogueBuild01", "SmallTipsAni")
    tipslist:AddChild(gcmp)
    local smallTips = gcmp:GetChild("SmallTips")
    ChangeUIController(smallTips, "type", controllerIndex)
    local titleText, contentText
    if n_type == RogueGameNotifyType.RECRUIT_NEW_CARD then
      titleText = T(20377)
      local cardId = v.cardId
      local conf = TableData.GetConfig(cardId, "BaseCard")
      contentText = T(20378, conf.name())
      UIUtil.SetHeadByFaceId(conf.fashion_id, smallTips:GetChild("Head"):GetChild("HeadBg"):GetChild("PicLoader"), HEAD_ICON_TYPE_ENUM.RECT)
    elseif n_type == RogueGameNotifyType.TREAT then
      titleText = T(20379)
      contentText = T(20380)
    elseif n_type == RogueGameNotifyType.REVIVE_CARD then
      local conf = TableData.GetConfig(v.cardId, "BaseCard")
      titleText = T(20381)
      contentText = T(20382, conf.name())
    elseif n_type == RogueGameNotifyType.TOKEN_GOT then
      titleText = T(20383)
      contentText = T(20384, v.count)
    elseif n_type == RogueGameNotifyType.ATTRIBUTE_GOT then
      titleText = T(20385)
      contentText = T(20386, v.count)
    elseif n_type == RogueGameNotifyType.HALIDOM_GOT then
      local conf = TableData.GetConfig(v, "BaseRogueHoly")
      titleText = T(20387)
      contentText = T(20388, conf.name())
      smallTips:GetChild("ItemLoader").url = UIUtil.GetResUrl(conf.icon)
    elseif n_type == RogueGameNotifyType.TREASURE_GOT then
      local conf = TableData.GetConfig(v, "BaseRogueTreasure")
      titleText = T(20389)
      contentText = T(20390, conf.name())
      smallTips:GetChild("ItemLoader").url = UIUtil.GetResUrl(conf.icon)
    end
    UIUtil.SetText(smallTips, titleText, "NameTxt")
    UIUtil.SetText(smallTips, contentText, "WordTxt")
    gcmp.alpha = 0
    local transition = gcmp:GetTransition("up")
    local delayTime = delay + (i - 1) * interval
    transition:Play(1, delayTime, function()
      transition:PlayReverse(1, 0.8, TransitionCallback, UpdateCallback)
    end, UpdateCallback)
    TimerUtil.setTimeout(delayTime, function()
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_item_reward_slide")
    end)
  end
  notifyDelay = delay + #items * interval
  PopupNotify(notifyDelay)
end

function PopupNotify(delay)
  if notifyCollector and _G.next(notifyCollector) then
    local notifyItem = table.remove(notifyCollector, 1)
    local n_type = notifyItem.type
    local items = notifyItem.items
    local controllerIndex = 0
    if n_type == RogueGameNotifyType.RECRUIT_NEW_CARD then
      controllerIndex = 0
    elseif n_type == RogueGameNotifyType.TREAT then
      controllerIndex = 1
    elseif n_type == RogueGameNotifyType.REVIVE_CARD then
      controllerIndex = 2
    elseif n_type == RogueGameNotifyType.TOKEN_GOT then
      controllerIndex = 3
    elseif n_type == RogueGameNotifyType.ATTRIBUTE_GOT then
      controllerIndex = 4
    elseif n_type == RogueGameNotifyType.HALIDOM_GOT then
      controllerIndex = 5
    elseif n_type == RogueGameNotifyType.TREASURE_GOT then
      controllerIndex = 5
    end
    DisplayNotify(n_type, items, controllerIndex, delay)
  end
end

function RogueGameInfoTipsWindow.ReInitData()
end

function RogueGameInfoTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameInfoTipsWindow.package, WinResConfig.RogueGameInfoTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideSmallWindowUis(contentPane)
    notifyCollector = bridgeObj.argTable[1]
    RogueGameInfoTipsWindow.UpdateInfo()
    RogueGameInfoTipsWindow.InitBtn()
  end)
end

function RogueGameInfoTipsWindow.UpdateInfo()
  PopupNotify()
end

function RogueGameInfoTipsWindow.InitBtn()
end

function RogueGameInfoTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  notifyCnt = 0
  notifyDelay = 0
end

function RogueGameInfoTipsWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.RogueGame.NOTIFY_ITEM_GOT then
    notifyCollector = para
    PopupNotify()
  end
end

return RogueGameInfoTipsWindow
