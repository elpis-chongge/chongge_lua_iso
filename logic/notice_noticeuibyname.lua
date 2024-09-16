require("Notice_LeftTabRegionByName")
require("Notice_TopTabRegionByName")

function GetNotice_NoticeUIUis(ui)
  local uis = {}
  uis.LeftTabRegion = GetNotice_LeftTabRegionUis(ui:GetChild("LeftTabRegion"))
  uis.TopTabRegion = GetNotice_TopTabRegionUis(ui:GetChild("TopTabRegion"))
  uis.ContentList = ui:GetChild("ContentList")
  uis.PicContentList = ui:GetChild("PicContentList")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
