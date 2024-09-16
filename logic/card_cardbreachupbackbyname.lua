require("Card_CardShowByName")

function GetCard_CardBreachUpBackUis(ui)
  local uis = {}
  uis.CardShow = GetCard_CardShowUis(ui:GetChild("CardShow"))
  uis.root = ui
  return uis
end
