require("Battle_DefenseFillBackByName")
require("Battle_DefenseFillByName")

function GetBattle_DefenseBarUis(ui)
  local uis = {}
  uis.bar_delay1 = GetBattle_DefenseFillBackUis(ui:GetChild("bar_delay1"))
  uis.bar = GetBattle_DefenseFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
