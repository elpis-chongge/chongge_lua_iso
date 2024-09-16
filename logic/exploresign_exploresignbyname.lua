require("CommonResource_PopupBgByName")
require("ExploreSign_MapByName")
require("ExploreSign_TitleByName")
require("ExploreSign_ExploreBtnAniByName")
require("ExploreSign_TipsWordByName")

function GetExploreSign_ExploreSignUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.Map = GetExploreSign_MapUis(ui:GetChild("Map"))
  uis.Title = GetExploreSign_TitleUis(ui:GetChild("Title"))
  uis.Explore = GetExploreSign_ExploreBtnAniUis(ui:GetChild("Explore"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.TipsWord = GetExploreSign_TipsWordUis(ui:GetChild("TipsWord"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
