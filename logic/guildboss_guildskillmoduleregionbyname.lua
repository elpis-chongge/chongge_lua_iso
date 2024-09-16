function GetGuildBoss_GuildSkillModuleRegionUis(ui)
  local uis = {}
  
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.SkillModule1Btn = ui:GetChild("SkillModule1Btn")
  uis.SkillModule2Btn = ui:GetChild("SkillModule2Btn")
  uis.SkillModule3Btn = ui:GetChild("SkillModule3Btn")
  uis.SkillModule4Btn = ui:GetChild("SkillModule4Btn")
  uis.SkillModule5Btn = ui:GetChild("SkillModule5Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
