function GetCommonResource_SkillUis(ui)
  local uis = {}
  
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
