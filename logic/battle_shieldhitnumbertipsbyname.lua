require("Battle_ShieldHitNumberByName")

function GetBattle_ShieldHitNumberTipsUis(ui)
  local uis = {}
  uis.ShieldHitNumber = GetBattle_ShieldHitNumberUis(ui:GetChild("ShieldHitNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
