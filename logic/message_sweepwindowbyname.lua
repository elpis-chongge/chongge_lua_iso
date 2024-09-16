require("Message_SweepByName")

function GetMessage_SweepWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_SweepUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
