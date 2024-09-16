function GetFormation_CardBadgeIconUis(ui)
  local uis = {}
  
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
