require("Formation_MonsterTipsByName")

function GetFormation_MonsterTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetFormation_MonsterTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
