require("GuildBoss_RecommendByName")

function GetGuildBoss_RecommendWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_RecommendUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
