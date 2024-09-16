function GetRogueBuild01_BookSacredItemBtnUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.newCtr = ui:GetController("new")
  uis.root = ui
  return uis
end
