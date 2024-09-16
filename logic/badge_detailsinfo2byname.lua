require("Badge_DetailsInfo2_1ByName")

function GetBadge_DetailsInfo2Uis(ui)
  local uis = {}
  uis.DetailsInfo2_1 = GetBadge_DetailsInfo2_1Uis(ui:GetChild("DetailsInfo2_1"))
  uis.WordList = ui:GetChild("WordList")
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.root = ui
  return uis
end
