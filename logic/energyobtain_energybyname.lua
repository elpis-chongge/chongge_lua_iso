require("CommonResource_BackGroundByName")
require("EnergyObtain_EnergyItemByName")
require("EnergyObtain_EnergyMunberByName")
require("CommonResource_CurrencyReturnByName")

function GetEnergyObtain_EnergyUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.UseBtn = ui:GetChild("UseBtn")
  uis.EnergyBuy = GetEnergyObtain_EnergyItemUis(ui:GetChild("EnergyBuy"))
  uis.ItemUse1 = GetEnergyObtain_EnergyItemUis(ui:GetChild("ItemUse1"))
  uis.ItemUse2 = GetEnergyObtain_EnergyItemUis(ui:GetChild("ItemUse2"))
  uis.EnergyMunber = GetEnergyObtain_EnergyMunberUis(ui:GetChild("EnergyMunber"))
  uis.AImage = ui:GetChild("AImage")
  uis.BImage = ui:GetChild("BImage")
  uis.CImage = ui:GetChild("CImage")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
