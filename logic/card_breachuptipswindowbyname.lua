require("Card_BreachUpTipsByName")

function GetCard_BreachUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetCard_BreachUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
