require("Battle_NormalHitNumberByName")

function GetBattle_NormalHitNumberTipsUis(ui)
  local uis = {}
  uis.NormalHitNumber = GetBattle_NormalHitNumberUis(ui:GetChild("NormalHitNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
