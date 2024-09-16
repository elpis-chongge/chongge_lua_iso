require("Message_Rename2ByName")

function GetMessage_RenameWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_Rename2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
