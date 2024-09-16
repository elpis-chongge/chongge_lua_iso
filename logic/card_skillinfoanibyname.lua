function GetCard_SkillInfoAniUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.OpenTxt = ui:GetChild("OpenTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.root = ui
  return uis
end
