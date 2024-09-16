function GetGuide_PicUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.LeftBtn = ui:GetChild("LeftBtn")
  uis.RightBtn = ui:GetChild("RightBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
