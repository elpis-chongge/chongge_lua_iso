require("Battle_CritHitNumberByName")

function GetBattle_CritHitNumberTipsUis(ui)
  local uis = {}
  uis.CritHitNumber = GetBattle_CritHitNumberUis(ui:GetChild("CritHitNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
