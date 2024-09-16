require("Formation_BattlePlayerNumberWordEffectByName")

function GetFormation_BattlePlayerNumberWordUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Effect = GetFormation_BattlePlayerNumberWordEffectUis(ui:GetChild("Effect"))
  uis.root = ui
  return uis
end
