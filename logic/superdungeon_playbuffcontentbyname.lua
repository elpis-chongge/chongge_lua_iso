function GetSuperDungeon_PlayBuffContentUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.BuffNameTxt = ui:GetChild("BuffNameTxt")
  uis.BuffNumberTxt = ui:GetChild("BuffNumberTxt")
  uis.BuffWordTxt = ui:GetChild("BuffWordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
