require("CardAttribute_CardAttributeTipsWordByName")

function GetCardAttribute_CardAttributeTipsUis(ui)
  local uis = {}
  uis.TipsWord = GetCardAttribute_CardAttributeTipsWordUis(ui:GetChild("TipsWord"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
