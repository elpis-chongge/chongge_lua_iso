require("ExploreSign_PlaceAniByName")

function GetExploreSign_MapUis(ui)
  local uis = {}
  uis.MapLoader = ui:GetChild("MapLoader")
  uis.MapHolder = ui:GetChild("MapHolder")
  uis.Place1Btn = GetExploreSign_PlaceAniUis(ui:GetChild("Place1Btn"))
  uis.Place2Btn = GetExploreSign_PlaceAniUis(ui:GetChild("Place2Btn"))
  uis.Place3Btn = GetExploreSign_PlaceAniUis(ui:GetChild("Place3Btn"))
  uis.Place4Btn = GetExploreSign_PlaceAniUis(ui:GetChild("Place4Btn"))
  uis.Place5Btn = GetExploreSign_PlaceAniUis(ui:GetChild("Place5Btn"))
  uis.Place6Btn = GetExploreSign_PlaceAniUis(ui:GetChild("Place6Btn"))
  uis.Place7Btn = GetExploreSign_PlaceAniUis(ui:GetChild("Place7Btn"))
  uis.Place8Btn = GetExploreSign_PlaceAniUis(ui:GetChild("Place8Btn"))
  uis.root = ui
  return uis
end
