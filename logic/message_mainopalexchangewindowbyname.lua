require("Message_MainOpalExchange2ByName")

function GetMessage_MainOpalExchangeWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_MainOpalExchange2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
