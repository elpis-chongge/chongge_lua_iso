require("Card_CardTipsBByName")

function GetCard_CardTipsAniBUis(ui)
  local uis = {}
  uis.CardTips = GetCard_CardTipsBUis(ui:GetChild("CardTips"))
  uis.root = ui
  return uis
end
