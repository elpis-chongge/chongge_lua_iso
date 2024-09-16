require("Battle_BurstCritHitNumberByName")

function GetBattle_BurstCritHitNumberTipsUis(ui)
  local uis = {}
  uis.CritHitNumber = GetBattle_BurstCritHitNumberUis(ui:GetChild("CritHitNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
