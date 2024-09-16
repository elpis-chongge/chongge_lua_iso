require("EnergyObtain_SurplusDayByName")

function GetEnergyObtain_EnergyItemBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.SurplusDay = GetEnergyObtain_SurplusDayUis(ui:GetChild("SurplusDay"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.LimitTxt = ui:GetChild("LimitTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
