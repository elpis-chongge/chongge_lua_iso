require("GuildBoss_RecommendCurrency2ByName")

function GetGuildBoss_RecommendCurrencyWindowUis(ui)
  local uis = {}
  uis.Main = GetGuildBoss_RecommendCurrency2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
