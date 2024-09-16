require("Card_CardAttributeTipsByName")

function GetCard_CardAttributeTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetCard_CardAttributeTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
