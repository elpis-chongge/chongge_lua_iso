function GetRogueBuild01_BookSacredConditionInfoUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.TypeTxt = ui:GetChild("TypeTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.LockBtn = ui:GetChild("LockBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
