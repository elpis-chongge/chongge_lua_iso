require("Battle_BurstBuffHitNumberByName")

function GetBattle_BurstBuffHitNumberTipsUis(ui)
  local uis = {}
  uis.BuffHitNumber = GetBattle_BurstBuffHitNumberUis(ui:GetChild("BuffHitNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
