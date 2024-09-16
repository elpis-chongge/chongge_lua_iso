require("Battle_BurstShieldHitNumberByName")

function GetBattle_BurstShieldHitNumberTipsUis(ui)
  local uis = {}
  uis.ShieldHitNumber = GetBattle_BurstShieldHitNumberUis(ui:GetChild("ShieldHitNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
