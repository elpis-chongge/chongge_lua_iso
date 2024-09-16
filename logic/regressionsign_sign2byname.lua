require("CommonResource_PopupBgByName")
require("RegressionSign_Sign1ByName")

function GetRegressionSign_Sign2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Sign1 = GetRegressionSign_Sign1Uis(ui:GetChild("Sign1"))
  uis.root = ui
  return uis
end
