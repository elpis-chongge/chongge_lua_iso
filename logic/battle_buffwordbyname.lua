function GetBattle_BuffWordUis(ui)
  local uis = {}
  
  uis.BattleWordLoader = ui:GetChild("BattleWordLoader")
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
