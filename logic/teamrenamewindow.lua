require("Message_RenameWindowByName")
local TeamRenameWindow = {}
local uis, contentPane, selectTeamId

function TeamRenameWindow.ReInitData()
end

local preTeamName

function TeamRenameWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.TeamRenameWindow.package, WinResConfig.TeamRenameWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    selectTeamId = bridgeObj.argTable[1]
    uis = GetMessage_RenameWindowUis(contentPane)
    TeamRenameWindow.UpdateInfo()
    TeamRenameWindow.InitBtn()
  end)
end

function TeamRenameWindow.UpdateInfo()
  uis.Main.Popup_B.BtnGroup.c1Ctr.selectedIndex = 1
  uis.Main.Rename1.NameTxt.promptText = T(1002)
end

function TeamRenameWindow.ClickClose()
  UIMgr:CloseWindow(WinResConfig.TeamRenameWindow.name)
end

function TeamRenameWindow.ClickSureBtn()
  local text = uis.Main.Rename1.NameTxt.text
  if string.find(text, " ") then
    FloatTipsUtil.ShowWarnTips(T(10050))
    return
  end
  if preTeamName == text then
    TeamRenameWindow.ClickClose()
    return
  end
  if string.len(text) <= 0 then
    FloatTipsUtil.ShowWarnTips(T(10049))
    return
  end
  if TeamData.HaveSameName(text) == true then
    FloatTipsUtil.ShowWarnTips(T(10051))
    return
  end
  if true == SensitiveWordsUtil.IsContainBlockedWord(text) then
    FloatTipsUtil.ShowWarnTips(T(11160))
    return
  end
  TeamService.ChangeCardTeamNameReq(selectTeamId, text)
end

function TeamRenameWindow.InitBtn()
  UIUtil.SetPopupBtnGroup(uis.Main.Popup_B.BtnGroup.root, {
    touchCallback = TeamRenameWindow.ClickSureBtn
  }, {
    touchCallback = TeamRenameWindow.ClickClose
  })
  uis.Main.TouchScreenBtn.onClick:Set(TeamRenameWindow.ClickClose)
end

function TeamRenameWindow.OnShown()
end

function TeamRenameWindow.OnHide()
end

function TeamRenameWindow.OnClose()
  preTeamName = nil
  selectTeamId = nil
  uis = nil
  contentPane = nil
end

function TeamRenameWindow.HandleMessage(msgId, para)
end

return TeamRenameWindow
