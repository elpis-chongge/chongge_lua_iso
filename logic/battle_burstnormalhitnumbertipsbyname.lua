require("Battle_BurstNormalHitNumberByName")

function GetBattle_BurstNormalHitNumberTipsUis(ui)
  local uis = {}
  uis.NormalHitNumber = GetBattle_BurstNormalHitNumberUis(ui:GetChild("NormalHitNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
