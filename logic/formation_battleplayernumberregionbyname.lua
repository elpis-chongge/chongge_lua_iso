require("Formation_BattlePlayerNumberRegion1ByName")

function GetFormation_BattlePlayerNumberRegionUis(ui)
  local uis = {}
  uis.Before = GetFormation_BattlePlayerNumberRegion1Uis(ui:GetChild("Before"))
  uis.After = GetFormation_BattlePlayerNumberRegion1Uis(ui:GetChild("After"))
  uis.root = ui
  return uis
end
