require("GuildBoss_RecommendTipsByName")

function GetGuildBoss_RecommendTipsAniUis(ui)
  local uis = {}
  uis.Tips = GetGuildBoss_RecommendTipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
