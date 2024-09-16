require("Sign_Module1ByName")
require("Sign_Module2ByName")
require("Sign_Module3ByName")

function GetSign_Sign1Uis(ui)
  local uis = {}
  uis.Pic1Loader = ui:GetChild("Pic1Loader")
  uis.Pic2Loader = ui:GetChild("Pic2Loader")
  uis.Pic3Loader = ui:GetChild("Pic3Loader")
  uis.Module1 = GetSign_Module1Uis(ui:GetChild("Module1"))
  uis.Module2 = GetSign_Module2Uis(ui:GetChild("Module2"))
  uis.Module3 = GetSign_Module3Uis(ui:GetChild("Module3"))
  uis.Close1Btn = ui:GetChild("Close1Btn")
  uis.Close2Btn = ui:GetChild("Close2Btn")
  uis.Close3Btn = ui:GetChild("Close3Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
