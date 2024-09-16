require("RogueBuild01_StartChoiceRegion_CardByName")

function GetRogueBuild01_StartChoiceRegion_CardAniUis(ui)
  local uis = {}
  uis.Card = GetRogueBuild01_StartChoiceRegion_CardUis(ui:GetChild("Card"))
  uis.root = ui
  return uis
end
