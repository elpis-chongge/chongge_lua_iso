require("CommonResource_BackGroundByName")
require("RogueBuild01_TalentBottomRegionByName")
require("RogueBuild01_TalentHaveNumberByName")
require("RogueBuild01_TalentLeftRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetRogueBuild01_TalentUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TalentBottomRegion = GetRogueBuild01_TalentBottomRegionUis(ui:GetChild("TalentBottomRegion"))
  uis.Number = GetRogueBuild01_TalentHaveNumberUis(ui:GetChild("Number"))
  uis.TreeList = ui:GetChild("TreeList")
  uis.TalentLeftRegion = GetRogueBuild01_TalentLeftRegionUis(ui:GetChild("TalentLeftRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
