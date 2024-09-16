require("Abyss_MapBuildTimeByName")
require("Abyss_MapBuildLockByName")
require("Abyss_MapBuildWordByName")
require("Abyss_MapBuildExploreByName")

function GetAbyss_MapBuildSignUis(ui)
  local uis = {}
  uis.MapBuildTime = GetAbyss_MapBuildTimeUis(ui:GetChild("MapBuildTime"))
  uis.MapBuildLock = GetAbyss_MapBuildLockUis(ui:GetChild("MapBuildLock"))
  uis.MapBuildWord = GetAbyss_MapBuildWordUis(ui:GetChild("MapBuildWord"))
  uis.MapBuildExplore = GetAbyss_MapBuildExploreUis(ui:GetChild("MapBuildExplore"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.c4Ctr = ui:GetController("c4")
  uis.root = ui
  return uis
end
