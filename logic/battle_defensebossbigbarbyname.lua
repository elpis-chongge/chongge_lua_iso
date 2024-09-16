require("Battle_DefenseBossBigFillBackByName")
require("Battle_DefenseBossBigFillByName")

function GetBattle_DefenseBossBigBarUis(ui)
  local uis = {}
  uis.bar_delay1 = GetBattle_DefenseBossBigFillBackUis(ui:GetChild("bar_delay1"))
  uis.bar = GetBattle_DefenseBossBigFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
