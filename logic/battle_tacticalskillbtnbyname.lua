function GetBattle_TacticalSkillBtnUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.SkillCDProgressBar = ui:GetChild("SkillCDProgressBar")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
