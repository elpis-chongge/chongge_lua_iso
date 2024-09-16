require("Carnival_ActivityByName")

function GetCarnival_ActivityWindowUis(ui)
  local uis = {}
  uis.Main = GetCarnival_ActivityUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
