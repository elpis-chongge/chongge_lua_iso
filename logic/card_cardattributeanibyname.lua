require("Card_CardAttributeByName")

function GetCard_CardAttributeAniUis(ui)
  local uis = {}
  uis.CardAttribute = GetCard_CardAttributeUis(ui:GetChild("CardAttribute"))
  uis.root = ui
  return uis
end
