require("Battle_BurstCardHeadRegion1ByName")

function GetBattle_BurstCardHeadRegionUis(ui)
  local uis = {}
  uis.BurstCardHeadList = GetBattle_BurstCardHeadRegion1Uis(ui:GetChild("BurstCardHeadList"))
  uis.root = ui
  return uis
end
