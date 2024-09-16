require("RaidBoss_PlayerRankTipsByName")

function GetRaidBoss_PlayerRankTipsAniUis(ui)
  local uis = {}
  uis.PlayerRankTips = GetRaidBoss_PlayerRankTipsUis(ui:GetChild("PlayerRankTips"))
  uis.root = ui
  return uis
end
