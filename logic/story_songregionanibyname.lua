require("Story_SongRegionByName")

function GetStory_SongRegionAniUis(ui)
  local uis = {}
  uis.SongRegion = GetStory_SongRegionUis(ui:GetChild("SongRegion"))
  uis.root = ui
  return uis
end
