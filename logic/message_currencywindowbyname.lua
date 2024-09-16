require("Message_Currency2ByName")

function GetMessage_CurrencyWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_Currency2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
