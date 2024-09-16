require("CommonResource_BackGroundByName")
require("InitialEnergy_EnergyTipsByName")

function GetInitialEnergy_InitialEnergyUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.EnergyTips1 = GetInitialEnergy_EnergyTipsUis(ui:GetChild("EnergyTips1"))
  uis.EnergyTips2 = GetInitialEnergy_EnergyTipsUis(ui:GetChild("EnergyTips2"))
  uis.EnergyTips3 = GetInitialEnergy_EnergyTipsUis(ui:GetChild("EnergyTips3"))
  uis.EnergyTips4 = GetInitialEnergy_EnergyTipsUis(ui:GetChild("EnergyTips4"))
  uis.root = ui
  return uis
end
