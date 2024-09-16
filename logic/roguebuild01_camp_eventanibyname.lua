require("RogueBuild01_Camp_EventByName")

function GetRogueBuild01_Camp_EventAniUis(ui)
  local uis = {}
  uis.Event = GetRogueBuild01_Camp_EventUis(ui:GetChild("Event"))
  uis.root = ui
  return uis
end
