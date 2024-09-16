function GetGuide_PicLookUis(ui)
  local uis = {}
  
  uis.PicList = ui:GetChild("PicList")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.PageNumberList = ui:GetChild("PageNumberList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
