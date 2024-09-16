require("EnergyObtain_EnergyByName")

function GetEnergyObtain_EnergyWindowUis(ui)
  local uis = {}
  uis.Main = GetEnergyObtain_EnergyUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
