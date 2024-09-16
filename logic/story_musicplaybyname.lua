require("CommonResource_BackGroundByName")
require("Story_SongInfoByName")
require("Story_SongRegionAniByName")
require("Story_SongStartByName")

function GetStory_MusicPlayUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.SongInfo = GetStory_SongInfoUis(ui:GetChild("SongInfo"))
  uis.SongRegionAni = GetStory_SongRegionAniUis(ui:GetChild("SongRegionAni"))
  uis.ListBtn = ui:GetChild("ListBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.SongStar = GetStory_SongStartUis(ui:GetChild("SongStar"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
