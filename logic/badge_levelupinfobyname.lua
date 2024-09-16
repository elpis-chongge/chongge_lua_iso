require("Badge_LevelUpInfo1ByName")
require("Badge_DetailsInfo1ByName")
require("Badge_DetailsInfo3ByName")
require("Badge_DetailsInfo2ByName")

function GetBadge_LevelUpInfoUis(ui)
  local uis = {}
  uis.LevelUpInfo1 = GetBadge_LevelUpInfo1Uis(ui:GetChild("LevelUpInfo1"))
  uis.DetailsInfo1 = GetBadge_DetailsInfo1Uis(ui:GetChild("DetailsInfo1"))
  uis.DetailsInfo3 = GetBadge_DetailsInfo3Uis(ui:GetChild("DetailsInfo3"))
  uis.DetailsInfo2 = GetBadge_DetailsInfo2Uis(ui:GetChild("DetailsInfo2"))
  uis.root = ui
  return uis
end
