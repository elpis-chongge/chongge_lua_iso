require("Message_DebrisByName")

function GetMessage_DebrisWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_DebrisUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
