function GetBattleData_GuildSkillRegionUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.DataLabel1Btn = ui:GetChild("DataLabel1Btn")
  uis.DataLabel2Btn = ui:GetChild("DataLabel2Btn")
  uis.DataLabel3Btn = ui:GetChild("DataLabel3Btn")
  uis.OwnSkillList = ui:GetChild("OwnSkillList")
  uis.root = ui
  return uis
end
