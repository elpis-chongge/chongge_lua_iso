require("Battle_CardHeadOccupationByName")

function GetBattle_CardHeadRegionUis(ui)
  local uis = {}
  uis.HeadList = ui:GetChild("HeadList")
  uis.Occupation = GetBattle_CardHeadOccupationUis(ui:GetChild("Occupation"))
  uis.root = ui
  return uis
end
