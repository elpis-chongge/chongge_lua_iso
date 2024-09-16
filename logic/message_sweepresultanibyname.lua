require("Message_SweepResultByName")

function GetMessage_SweepResultAniUis(ui)
  local uis = {}
  uis.SweepResult = GetMessage_SweepResultUis(ui:GetChild("SweepResult"))
  uis.root = ui
  return uis
end
