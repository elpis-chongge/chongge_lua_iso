require("Formation_BuffTipsByName")

function GetFormation_BuffTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetFormation_BuffTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
