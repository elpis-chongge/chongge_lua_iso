require("CommonResource_Quality1_1ByName")
require("CommonResource_Quality1_2ByName")

function GetCommonResource_PlayerHeadUis(ui)
  local uis = {}
  uis.Quality1_1 = GetCommonResource_Quality1_1Uis(ui:GetChild("Quality1_1"))
  uis.HeadLoader = ui:GetChild("HeadLoader")
  uis.Quality1_2 = GetCommonResource_Quality1_2Uis(ui:GetChild("Quality1_2"))
  uis.root = ui
  return uis
end
