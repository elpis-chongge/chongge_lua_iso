require("Message_BadgeGetTipsWindowByName")
local BadgeGetTipsWindow = {}
local uis, contentPane, badgeConfig

function BadgeGetTipsWindow.ReInitData()
end

function BadgeGetTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeGetTipsWindow.package, WinResConfig.BadgeGetTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetMessage_BadgeGetTipsWindowUis(contentPane)
    local itemId = bridgeObj.argTable[1]
    badgeConfig = TableData.GetConfig(itemId, "BaseBadge")
    if badgeConfig then
      BadgeGetTipsWindow.UpdateInfo()
    end
    BadgeGetTipsWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GET_ITEM_IN)
  end)
end

function BadgeGetTipsWindow.UpdateInfo()
  function uis.Main.WordList.itemRenderer(i, item)
    local suitConfig = TableData.GetConfig(badgeConfig.suit_group_id, "BaseBadgeSuitGroup")
    
    if suitConfig then
      uis.Main.NameTxt.text = suitConfig.name()
      uis.Main.PicLoaderr.url = UIUtil.GetResUrl(suitConfig.icon)
      local suitData = TableData.GetConfig(suitConfig.suit_id[1], "BaseBadgeSuit")
      if suitData then
        UIUtil.SetText(item, suitData.des(), "WordTxt")
      end
      suitData = TableData.GetConfig(suitConfig.suit_id[2], "BaseBadgeSuit")
      if suitData then
        UIUtil.SetText(item, suitData.des(), "Word1Txt")
      end
      UIUtil.SetText(item, suitConfig.des(), "UseTxt")
    end
  end
  
  uis.Main.WordList.numItems = 1
  ChangeController(uis.Main.c2Ctr, 1)
  ChangeController(uis.Main.c1Ctr, 1)
end

function BadgeGetTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BadgeGetTipsWindow.name)
  end)
end

function BadgeGetTipsWindow.OnClose()
  uis = nil
  contentPane = nil
end

return BadgeGetTipsWindow
