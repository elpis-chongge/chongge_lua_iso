require("Story_SongNameRegionByName")
require("CommonResource_ListRedDotByName")
require("CommonResource_ListRedDot1ByName")

function GetStory_MusicUis(ui)
  local uis = {}
  uis.CoverList = ui:GetChild("CoverList")
  uis.SongNameRegion = GetStory_SongNameRegionUis(ui:GetChild("SongNameRegion"))
  uis.CoverBtn = ui:GetChild("CoverBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.ListRedDot = GetCommonResource_ListRedDotUis(ui:GetChild("ListRedDot"))
  uis.ListRedDot1 = GetCommonResource_ListRedDot1Uis(ui:GetChild("ListRedDot1"))
  uis.c1Ctr = ui:GetController("c1")
  uis.ListCtr = ui:GetController("List")
  uis.ListLeftCtr = ui:GetController("ListLeft")
  uis.root = ui
  return uis
end
