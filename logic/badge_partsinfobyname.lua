require("Badge_PartsCardByName")

function GetBadge_PartsInfoUis(ui)
  local uis = {}
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.PartsCard = GetBadge_PartsCardUis(ui:GetChild("PartsCard"))
  uis.RecommendWearBtn = ui:GetChild("RecommendWearBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
