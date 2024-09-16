require("GuildBoss_BossEndWindowByName")
local GuildBossEndWindow = {}
local uis, contentPane

function GuildBossEndWindow.ReInitData()
end

function GuildBossEndWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.GuildBossEndWindow.package, WinResConfig.GuildBossEndWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetGuildBoss_BossEndWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/TradeUnionWar_cover/FX_ui_TradeUnionWar_cover_unani.prefab", uis.Main.BackGround.BackGroundHolder)
    GuildBossEndWindow.UpdateInfo()
    GuildBossEndWindow.InitBtn()
  end)
end

function GuildBossEndWindow.UpdateInfo()
end

function GuildBossEndWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.GuildBossEndWindow.name)
  end)
  UIUtil.SetText(uis.Main.RankBtn, T(1575))
  uis.Main.RankBtn.onClick:Set(function()
    GuildWarService.GetGuildWarRankReq(0, function()
      OpenWindow(WinResConfig.GuildWarRankWindow.name)
    end)
  end)
  UIUtil.SetText(uis.Main.HelpBtn, T(1576))
  uis.Main.HelpBtn.onClick:Set(function()
    OpenWindow(WinResConfig.GuildWarCardAssistWindow.name)
  end)
  UIUtil.SetText(uis.Main.SkillBtn, T(1577))
  uis.Main.SkillBtn.onClick:Set(function()
    OpenWindow(WinResConfig.GuildWarSkillWindow.name)
  end)
  UIUtil.SetText(uis.Main.RankRewardBtn, T(20535), "WordTxt")
  uis.Main.RankRewardBtn.onClick:Set(function()
    GuildWarService.GetGuildWarRankReq(0, function()
      local rankInfo = GuildWarData.GetRankInfo()
      local rank
      if 0 ~= rankInfo.rank and rankInfo.rank < 101 then
        rank = rankInfo.rank
      else
        rank = rankInfo.rankRatio
      end
      OpenWindow(WinResConfig.GuildWarRankRewardWindow.name, nil, rank)
    end)
  end)
  uis.Main.Word.WordTxt.text = T(1578)
end

function GuildBossEndWindow.OnClose()
  uis = nil
  contentPane = nil
end

return GuildBossEndWindow
