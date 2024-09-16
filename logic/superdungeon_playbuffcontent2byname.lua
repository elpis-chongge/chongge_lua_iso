function GetSuperDungeon_PlayBuffContent2Uis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.BuffNameTxt = ui:GetChild("BuffNameTxt")
  uis.BuffWordTxt = ui:GetChild("BuffWordTxt")
  uis.PicBuffLoader = ui:GetChild("PicBuffLoader")
  uis.BuffNumberTxt = ui:GetChild("BuffNumberTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.root = ui
  return uis
end
