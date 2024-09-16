function GetRogueBuild01_BookEndWordUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.LookBtn = ui:GetChild("LookBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
