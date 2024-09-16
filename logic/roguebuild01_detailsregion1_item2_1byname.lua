require("RogueBuild01_BookSacredHeadByName")

function GetRogueBuild01_DetailsRegion1_Item2_1Uis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Head = GetRogueBuild01_BookSacredHeadUis(ui:GetChild("Head"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
