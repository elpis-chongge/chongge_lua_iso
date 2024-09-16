require("Battle_BuffHitNumberByName")

function GetBattle_BuffHitNumberTipsUis(ui)
  local uis = {}
  uis.BuffHitNumber = GetBattle_BuffHitNumberUis(ui:GetChild("BuffHitNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
