require("RogueBuild01_InsideEndWindowByName")
local RogueGameEndWindow = {}
local uis, contentPane, callback, endingId
local duration = 2
local tweenId
local Finish = function()
  if type(endingId) == "number" and endingId > 0 then
    OpenWindow(WinResConfig.RogueGameEndingWindow.name, nil, endingId, callback)
  elseif callback then
    callback()
  end
  SoundUtil.PlayLastMusic()
  UIMgr:CloseWindow(WinResConfig.RogueGameEndWindow.name)
end

function RogueGameEndWindow.ReInitData()
end

function RogueGameEndWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.RogueGameEndWindow.package, WinResConfig.RogueGameEndWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetRogueBuild01_InsideEndWindowUis(contentPane)
    callback = bridgeObj.argTable[1]
    endingId = bridgeObj.argTable[2]
    RogueGameEndWindow.UpdateInfo()
    RogueGameEndWindow.InitBtn()
    SoundUtil.StopCurMusic()
    SoundManager:PlayMusicSound("event:/bgm/bgm_jingle/bgm_j01", "bank:/bgm/bgm_jingle/bgm_j01")
  end)
end

function RogueGameEndWindow.UpdateInfo()
  uis.Main.WordTxt.text = T(20440)
end

function RogueGameEndWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(Finish)
end

function RogueGameEndWindow.OnClose()
  uis = nil
  contentPane = nil
  if tweenId then
    LeanTween.cancel(tweenId)
  end
  tweenId = -1
  callback = nil
end

return RogueGameEndWindow
