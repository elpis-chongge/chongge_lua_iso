function GetCommonResource_BadgeFrameUis(ui)
  local uis = {}
  
  uis.HeadLoader = ui:GetChild("HeadLoader")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
