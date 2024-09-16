require("Battle_HpBossBigFillBackByName")
require("Battle_HpBossBigFillByName")

function GetBattle_HpBossBigBarUis(ui)
  local uis = {}
  uis.bar_delay = GetBattle_HpBossBigFillBackUis(ui:GetChild("bar_delay"))
  uis.bar = GetBattle_HpBossBigFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
