require("RogueBuild01_Camp_GetCurrencyTipsByName")

function GetRogueBuild01_Camp_GetCurrencyTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_Camp_GetCurrencyTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
