require("RegressionSign_Module1ByName")

function GetRegressionSign_Sign1Uis(ui)
  local uis = {}
  uis.Pic1Loader = ui:GetChild("Pic1Loader")
  uis.Module1 = GetRegressionSign_Module1Uis(ui:GetChild("Module1"))
  uis.Close1Btn = ui:GetChild("Close1Btn")
  uis.root = ui
  return uis
end
