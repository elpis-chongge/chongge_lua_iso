require("Battle_BurstGreenHpNumberByName")

function GetBattle_BurstGreenHpNumberTipsUis(ui)
  local uis = {}
  uis.GreenHpNumber = GetBattle_BurstGreenHpNumberUis(ui:GetChild("GreenHpNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
