require("GuildBoss_RecommendScreenWindowByName")
local RecommendScreenWindow = {}
local uis, contentPane, filterCardIdList

function RecommendScreenWindow.ReInitData()
end

function RecommendScreenWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RecommendScreenWindow.package, WinResConfig.RecommendScreenWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_RecommendScreenWindowUis(contentPane)
    filterCardIdList = bridgeObj.argTable[1]
    RecommendScreenWindow.UpdateInfo()
    RecommendScreenWindow.InitBtn()
  end)
end

function RecommendScreenWindow.UpdateInfo()
end

function RecommendScreenWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.RecommendScreenWindow.name)
  end)
  UIUtil.SetBtnText(uis.Main.Tips.Popup_S_Black_Btn, T(11720))
  uis.Main.Tips.Popup_S_Black_Btn.onClick:Set(function()
    filterCardIdList = nil
    UIMgr:CloseWindow(WinResConfig.RecommendScreenWindow.name)
  end)
  UIUtil.SetBtnText(uis.Main.Tips.Popup_S_Green_Btn, T(11721))
  uis.Main.Tips.Popup_S_Green_Btn.onClick:Set(function()
    UIMgr:SendWindowMessage(WinResConfig.GuildWarRecommendWindow.name, WindowMsgEnum.GuildWarRecommendWindow.UPDATE_FILTER, filterCardIdList)
    UIMgr:CloseWindow(WinResConfig.RecommendScreenWindow.name)
  end)
end

function RecommendScreenWindow.OnClose()
  uis = nil
  contentPane = nil
  filterCardIdList = nil
end

return RecommendScreenWindow
