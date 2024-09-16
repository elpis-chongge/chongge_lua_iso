require("Message_DispatchNumber2ByName")

function GetMessage_DispatchNumberWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_DispatchNumber2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
