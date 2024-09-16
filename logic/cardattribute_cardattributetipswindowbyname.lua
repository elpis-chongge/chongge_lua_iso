require("CardAttribute_CardAttributeTipsByName")

function GetCardAttribute_CardAttributeTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetCardAttribute_CardAttributeTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
