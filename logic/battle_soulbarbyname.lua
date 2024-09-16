require("Battle_SoulFillByName")

function GetBattle_SoulBarUis(ui)
  local uis = {}
  uis.bar = GetBattle_SoulFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
