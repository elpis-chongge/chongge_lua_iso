require("Battle_HpFillBackByName")
require("Battle_HpFillByName")

function GetBattle_HpBarUis(ui)
  local uis = {}
  uis.bar_delay = GetBattle_HpFillBackUis(ui:GetChild("bar_delay"))
  uis.bar = GetBattle_HpFillUis(ui:GetChild("bar"))
  uis.SoulProgressBar = ui:GetChild("SoulProgressBar")
  uis.root = ui
  return uis
end
