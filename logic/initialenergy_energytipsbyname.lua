require("InitialEnergy_EnergyPicByName")
require("InitialEnergy_EnergyGetByName")
require("InitialEnergy_EnergyNumberByName")

function GetInitialEnergy_EnergyTipsUis(ui)
  local uis = {}
  uis.PointImage = ui:GetChild("PointImage")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.EnergyPic = GetInitialEnergy_EnergyPicUis(ui:GetChild("EnergyPic"))
  uis.EnergyGet = GetInitialEnergy_EnergyGetUis(ui:GetChild("EnergyGet"))
  uis.EnergyNumber = GetInitialEnergy_EnergyNumberUis(ui:GetChild("EnergyNumber"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
