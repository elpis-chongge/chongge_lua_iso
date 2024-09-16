require("Badge_DetailsInfo1ByName")
require("Badge_DetailsInfo2ByName")
require("Badge_DetailsInfo3ByName")
require("Badge_ContrastUserByName")

function GetBadge_ContrastTipsUis(ui)
  local uis = {}
  uis.DetailsInfo1 = GetBadge_DetailsInfo1Uis(ui:GetChild("DetailsInfo1"))
  uis.DetailsInfo2 = GetBadge_DetailsInfo2Uis(ui:GetChild("DetailsInfo2"))
  uis.DetailsInfo3 = GetBadge_DetailsInfo3Uis(ui:GetChild("DetailsInfo3"))
  uis.ContrastUser = GetBadge_ContrastUserUis(ui:GetChild("ContrastUser"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
