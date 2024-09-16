require("InitialCarnival_CarnivalTabProgressByName")

function GetInitialCarnival_CarnivalTabUis(ui)
  local uis = {}
  uis.TabList = ui:GetChild("TabList")
  uis.CarnivalTabProgress = GetInitialCarnival_CarnivalTabProgressUis(ui:GetChild("CarnivalTabProgress"))
  uis.root = ui
  return uis
end
