require("Shop_Day1ByName")
require("Shop_Day2ByName")
require("Shop_Day3ByName")
require("Shop_FirstRechargeCompleteByName")

function GetShop_FirstRechargeUis(ui)
  local uis = {}
  uis.Day1 = GetShop_Day1Uis(ui:GetChild("Day1"))
  uis.Day2 = GetShop_Day2Uis(ui:GetChild("Day2"))
  uis.Day3 = GetShop_Day3Uis(ui:GetChild("Day3"))
  uis.Day1List = ui:GetChild("Day1List")
  uis.Day2List = ui:GetChild("Day2List")
  uis.Day3List = ui:GetChild("Day3List")
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Complete = GetShop_FirstRechargeCompleteUis(ui:GetChild("Complete"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
