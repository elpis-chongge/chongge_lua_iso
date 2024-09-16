require("Message_Code2ByName")

function GetMessage_CodeWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_Code2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
