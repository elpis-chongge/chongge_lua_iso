function GetGuildBoss_RecommendSkillUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
