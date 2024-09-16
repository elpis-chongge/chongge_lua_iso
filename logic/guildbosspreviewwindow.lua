require("GuildBoss_BossPreviewWindowByName")
local GuildBossPreviewWindow = {}
local uis, contentPane

function GuildBossPreviewWindow.ReInitData()
end

function GuildBossPreviewWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildBossPreviewWindow.package, WinResConfig.GuildBossPreviewWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_BossPreviewWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/TradeUnionWar_cover/FX_ui_TradeUnionWar_cover_unani.prefab", uis.Main.BackGround.BackGroundHolder)
    GuildBossPreviewWindow.UpdateInfo()
    GuildBossPreviewWindow.InitBtn()
    SoundUtil.PlayMusic(100105)
  end)
end

function GuildBossPreviewWindow.UpdateInfo()
  uis.Main.Time.WordTxt.text = T(1572)
  uis.Main.WordTxt.text = T(1573)
  local info = GuildWarData.GetGuildScheduleInfo()
  if info then
    uis.Main.Time.TimeTxt.text = T(1574, TimeUtil.FormatEnTime(info.endStamp - LoginData.GetCurServerTime()))
  end
end

function GuildBossPreviewWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildBossPreviewWindow.name)
  end)
end

function GuildBossPreviewWindow.OnClose()
  uis = nil
  contentPane = nil
end

return GuildBossPreviewWindow
