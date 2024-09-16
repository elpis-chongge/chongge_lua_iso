require("RogueBuild01_TalentLeftOrdinaryRegionByName")
require("RogueBuild01_TalentLeftSpecialRegionByName")

function GetRogueBuild01_TalentLeftRegionUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.OrdinaryRegion = GetRogueBuild01_TalentLeftOrdinaryRegionUis(ui:GetChild("OrdinaryRegion"))
  uis.SpecialRegion = GetRogueBuild01_TalentLeftSpecialRegionUis(ui:GetChild("SpecialRegion"))
  uis.root = ui
  return uis
end
