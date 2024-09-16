require("Card_CardTipsAByName")

function GetCard_CardTipsAniAUis(ui)
  local uis = {}
  uis.CardTips = GetCard_CardTipsAUis(ui:GetChild("CardTips"))
  uis.root = ui
  return uis
end
