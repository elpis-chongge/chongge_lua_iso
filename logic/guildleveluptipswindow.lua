require("Guild_LevelUpTipsWindowByName")
local GuildLevelUpTipsWindow = {}
local uis, contentPane, lv

function GuildLevelUpTipsWindow.ReInitData()
end

function GuildLevelUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildLevelUpTipsWindow.package, WinResConfig.GuildLevelUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuild_LevelUpTipsWindowUis(contentPane)
    if bridgeObj.argTable[1] then
      lv = bridgeObj.argTable[1]
    end
    GuildLevelUpTipsWindow.InitBtn()
    GuildLevelUpTipsWindow.UpdateTextDisplay()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GUILD_LEVEL_UP)
  end)
end

function GuildLevelUpTipsWindow.UpdateTextDisplay()
  uis.Main.LevelUpTips1.SubtitleTxt.text = T(1305)
  uis.Main.LevelUpTips1.TitleTxt.text = T(1306)
  if lv then
    uis.Main.LevelUpTips1.LevelTxt.text = lv
    uis.Main.LevelUpTips1.LevelNameTxt.text = T(1304)
  end
end

function GuildLevelUpTipsWindow.InitBtn()
  uis.Main.root.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildLevelUpTipsWindow.name)
  end)
end

function GuildLevelUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  lv = nil
end

function GuildLevelUpTipsWindow.HandleMessage(msgId, para)
end

return GuildLevelUpTipsWindow
