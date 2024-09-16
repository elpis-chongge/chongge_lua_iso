require("Battle_BurstAutoProgressFillByName")

function GetBattle_BurstAutoProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBattle_BurstAutoProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
