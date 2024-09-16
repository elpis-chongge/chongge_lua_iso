require("BossDungeon_BossOpenTipsWindowByName")
local BossOpenTipsWindow = {}
local uis, contentPane, callBack

function BossOpenTipsWindow.ReInitData()
end

function BossOpenTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BossOpenTipsWindow.package, WinResConfig.BossOpenTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBossDungeon_BossOpenTipsWindowUis(contentPane)
    local stageName = bridgeObj.argTable[1]
    callBack = bridgeObj.argTable[2]
    if stageName then
      uis.Main.TipsNumber.NumberTxt.text = stageName
    end
    BossOpenTipsWindow.UpdateInfo()
    BossOpenTipsWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.BOSS_OPEN_TIPS)
  end)
end

function BossOpenTipsWindow.UpdateInfo()
  uis.Main.TitleTxt.text = T(1339)
  uis.Main.TipsNumber.WordTxt.text = T(1340)
end

function BossOpenTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BossOpenTipsWindow.name)
  end)
end

function BossOpenTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  if type(callBack) == "function" then
    callBack()
    callBack = nil
  end
end

return BossOpenTipsWindow
