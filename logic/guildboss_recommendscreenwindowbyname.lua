require("GuildBoss_RecommendScreenByName")

function GetGuildBoss_RecommendScreenWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_RecommendScreenUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
