require("Story_MainPlotPicByName")
require("Story_Tab1RegionByName")
require("Story_SegmentRegionByName")

function GetStory_MainPlotReviewUis(ui)
  local uis = {}
  uis.MainPlotPic = GetStory_MainPlotPicUis(ui:GetChild("MainPlotPic"))
  uis.Tab1Region = GetStory_Tab1RegionUis(ui:GetChild("Tab1Region"))
  uis.SegmentRegion = GetStory_SegmentRegionUis(ui:GetChild("SegmentRegion"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
