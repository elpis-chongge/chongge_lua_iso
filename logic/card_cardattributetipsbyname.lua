require("Card_CardAttributeTipsWordByName")

function GetCard_CardAttributeTipsUis(ui)
  local uis = {}
  uis.TipsWord = GetCard_CardAttributeTipsWordUis(ui:GetChild("TipsWord"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
