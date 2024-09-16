function GetArena_MapLockEntryBtnUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LockTxt = ui:GetChild("LockTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
