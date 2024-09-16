require("Card_BreachUp1ByName")
require("Card_BreachUp2ByName")

function GetCard_CardBreachUpUis(ui)
  local uis = {}
  uis.BreachUp1 = GetCard_BreachUp1Uis(ui:GetChild("BreachUp1"))
  uis.BreachUp2 = GetCard_BreachUp2Uis(ui:GetChild("BreachUp2"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.root = ui
  return uis
end
