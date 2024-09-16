require("Battle_GreenHpNumberByName")

function GetBattle_GreenHpNumberTipsUis(ui)
  local uis = {}
  uis.GreenHpNumber = GetBattle_GreenHpNumberUis(ui:GetChild("GreenHpNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
