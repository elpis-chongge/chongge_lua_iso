require("CommonResource_HeadFrame_RByName")
require("CommonResource_BuildFrame_RByName")

function GetCommonResource_AllFrame_R_BtnUis(ui)
  local uis = {}
  uis.HeadFrame_R = GetCommonResource_HeadFrame_RUis(ui:GetChild("HeadFrame_R"))
  uis.BuildFrame_R = GetCommonResource_BuildFrame_RUis(ui:GetChild("BuildFrame_R"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
