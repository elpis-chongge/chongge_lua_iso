function GetCard_SkillWordNextUis(ui)
  local uis = {}
  
  uis.LevelNextTxt = ui:GetChild("LevelNextTxt")
  uis.WordNextList = ui:GetChild("WordNextList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
