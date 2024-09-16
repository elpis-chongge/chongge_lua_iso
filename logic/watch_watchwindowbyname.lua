require("Watch_WatchByName")

function GetWatch_WatchWindowUis(ui)
  local uis = {}
  uis.Main = GetWatch_WatchUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
