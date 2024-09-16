require("Message_OpalExchange2ByName")

function GetMessage_OpalExchangeWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_OpalExchange2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
