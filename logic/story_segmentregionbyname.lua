function GetStory_SegmentRegionUis(ui)
  local uis = {}
  
  uis.SegmentList = ui:GetChild("SegmentList")
  uis.root = ui
  return uis
end
