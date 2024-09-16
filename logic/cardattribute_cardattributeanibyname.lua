require("CardAttribute_CardAttributeByName")

function GetCardAttribute_CardAttributeAniUis(ui)
  local uis = {}
  uis.CardAttribute = GetCardAttribute_CardAttributeUis(ui:GetChild("CardAttribute"))
  uis.root = ui
  return uis
end
