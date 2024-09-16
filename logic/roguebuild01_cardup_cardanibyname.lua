require("RogueBuild01_CardUp_CardByName")

function GetRogueBuild01_CardUp_CardAniUis(ui)
  local uis = {}
  uis.Card = GetRogueBuild01_CardUp_CardUis(ui:GetChild("Card"))
  uis.root = ui
  return uis
end
