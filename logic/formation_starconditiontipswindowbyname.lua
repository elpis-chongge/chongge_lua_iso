require("Formation_StarConditionTipsByName")

function GetFormation_StarConditionTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetFormation_StarConditionTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
