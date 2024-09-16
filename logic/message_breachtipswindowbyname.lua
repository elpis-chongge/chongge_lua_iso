require("Message_BreachTipsByName")

function GetMessage_BreachTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_BreachTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
