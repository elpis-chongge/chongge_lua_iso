require("Badge_DetailsInfo1ByName")
require("Badge_DetailsInfo2ByName")
require("Badge_DetailsInfo3ByName")

function GetBadge_DetailsInfoUis(ui)
  local uis = {}
  uis.DetailsInfo1 = GetBadge_DetailsInfo1Uis(ui:GetChild("DetailsInfo1"))
  uis.ContrastBtn = ui:GetChild("ContrastBtn")
  uis.DetailsInfo2 = GetBadge_DetailsInfo2Uis(ui:GetChild("DetailsInfo2"))
  uis.DetailsInfo3 = GetBadge_DetailsInfo3Uis(ui:GetChild("DetailsInfo3"))
  uis.LeveUpBtn = ui:GetChild("LeveUpBtn")
  uis.DownBtn = ui:GetChild("DownBtn")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
