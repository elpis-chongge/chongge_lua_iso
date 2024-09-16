require("Message_MonthGetByName")

function GetMessage_MonthGetWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_MonthGetUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
