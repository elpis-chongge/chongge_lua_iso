require("ActivityDungeon1001_MiniStart_EndRewardWindowByName")
local Activity2MiniGameSubmitWindow = {}
local uis, contentPane, score, consumeSeconds

function Activity2MiniGameSubmitWindow.ReInitData()
end

function Activity2MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity2MiniGameSubmitWindow.package, WinResConfig.Activity2MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1001_MiniStart_EndRewardWindowUis(contentPane)
    score = bridgeObj.argTable[1]
    consumeSeconds = math.floor(bridgeObj.argTable[2])
    Activity2MiniGameSubmitWindow.UpdateInfo()
    Activity2MiniGameSubmitWindow.InitBtn()
  end)
end

function Activity2MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  local titleTxt = T(20531)
  local scoreTxt = T(20532)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  UIUtil.SetText(uis.Main.root, titleTxt, "TitleTxt")
  UIUtil.SetText(uis.Main.root, scoreTxt, "NumberWordTxt")
  UIUtil.SetText(uis.Main.root, score, "NumberTxt")
end

function Activity2MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    Activity2_MiniGameService.MiniGameSubmitReq({}, score, consumeSeconds, function()
      UIMgr:CloseToWindow(WinResConfig.Activity2MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity2_MiniGameService.MiniGameSubmitReq({}, score, consumeSeconds, function()
      UIMgr:SendWindowMessage(WinResConfig.Activity2MiniGameWindow.name, WindowMsgEnum.Activity2_MiniGame.RESET)
      UIMgr:CloseWindow(WinResConfig.Activity2MiniGameSubmitWindow.name)
    end)
  end)
end

function Activity2MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity2MiniGameSubmitWindow
