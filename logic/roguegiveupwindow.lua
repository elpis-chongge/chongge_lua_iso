require("RogueBuild01_GiveUpWindowByName")
local RogueGiveUpWindow = {}
local uis, contentPane

function RogueGiveUpWindow.ReInitData()
end

function RogueGiveUpWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGiveUpWindow.package, WinResConfig.RogueGiveUpWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_GiveUpWindowUis(contentPane)
    RogueGiveUpWindow.UpdateInfo()
    RogueGiveUpWindow.InitBtn()
  end)
end

function RogueGiveUpWindow.UpdateInfo()
  uis.Main.Currency1.WordTxt.text = T(1437)
  uis.Main.Currency1.Word1Txt.text = T(1438)
end

function RogueGiveUpWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(RogueGiveUpWindow.ClickClose)
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
    touchCallback = function()
      if not RogueGameData.GetThemeInfo() then
        RogueGameData.SetThemeInfo(RogueData.GetRogueTheme())
      end
      RogueService.QuitRogueGameReq(function()
        RogueGiveUpWindow.ClickClose()
      end)
    end
  }, {
    touchCallback = RogueGiveUpWindow.ClickClose
  })
end

function RogueGiveUpWindow.ClickClose()
  UIMgr:CloseWindow(WinResConfig.RogueGiveUpWindow.name)
end

function RogueGiveUpWindow.OnClose()
  uis = nil
  contentPane = nil
end

return RogueGiveUpWindow
