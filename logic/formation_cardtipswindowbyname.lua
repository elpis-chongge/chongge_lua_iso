require("Formation_CardTipsByName")

function GetFormation_CardTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetFormation_CardTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
