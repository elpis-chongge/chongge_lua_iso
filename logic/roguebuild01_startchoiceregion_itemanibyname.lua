require("RogueBuild01_StartChoiceRegion_ItemByName")

function GetRogueBuild01_StartChoiceRegion_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetRogueBuild01_StartChoiceRegion_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
