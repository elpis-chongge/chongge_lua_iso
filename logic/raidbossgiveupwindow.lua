require("RaidBoss_GiveUpWindowByName")
local RaidBossGiveUpWindow = {}
local uis, contentPane, stageId, callback

function RaidBossGiveUpWindow.ReInitData()
end

function RaidBossGiveUpWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RaidBossGiveUpWindow.package, WinResConfig.RaidBossGiveUpWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    callback = bridgeObj.argTable[1]
    uis = GetRaidBoss_GiveUpWindowUis(contentPane)
    RaidBossGiveUpWindow.UpdateInfo()
    RaidBossGiveUpWindow.InitBtn()
  end)
end

local CloseWindow = function()
  UIMgr:CloseWindow(WinResConfig.RaidBossGiveUpWindow.name)
end

function RaidBossGiveUpWindow.UpdateInfo()
  local titleText = T(20270)
  local contentText = T(20271)
  local sureBtnText = T(20272)
  local closeBtnText = T(20273)
  local panel = uis.Main.GiveUpContent
  panel.TitleTxt.text = titleText
  panel.WordTxt.text = contentText
  UIUtil.SetBtnText(panel.SureBtn, sureBtnText)
  UIUtil.SetBtnText(panel.CloseBtn, closeBtnText)
end

function RaidBossGiveUpWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(CloseWindow)
  uis.Main.GiveUpContent.CloseBtn.onClick:Set(CloseWindow)
  uis.Main.GiveUpContent.SureBtn.onClick:Set(function()
    if type(callback) == "function" then
      callback()
    end
    CloseWindow()
  end)
end

function RaidBossGiveUpWindow.OnClose()
  uis = nil
  contentPane = nil
  callback = nil
end

return RaidBossGiveUpWindow
