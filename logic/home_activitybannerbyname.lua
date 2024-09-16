function GetHome_ActivityBannerUis(ui)
  local uis = {}
  
  uis.PicList = ui:GetChild("PicList")
  uis.PageNumberList = ui:GetChild("PageNumberList")
  uis.root = ui
  return uis
end
