require("Formation_BuildTipsByName")

function GetFormation_BuildTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetFormation_BuildTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
