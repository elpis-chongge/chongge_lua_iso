require("CommonResource_AbyssSign3ByName")

function GetAbyss_TabBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.AbyssSign = GetCommonResource_AbyssSign3Uis(ui:GetChild("AbyssSign"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
