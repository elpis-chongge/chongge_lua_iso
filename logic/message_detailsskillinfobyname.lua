function GetMessage_DetailsSkillInfoUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.SkillList = ui:GetChild("SkillList")
  uis.root = ui
  return uis
end
