require("RegressionSign_Sign2ByName")

function GetRegressionSign_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetRegressionSign_Sign2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
