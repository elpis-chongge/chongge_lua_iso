function GetBadge_LevelUpItemBtnUis(ui)
  local uis = {}
  
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
