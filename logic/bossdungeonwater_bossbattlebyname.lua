require("CommonResource_BackGroundByName")
require("BossDungeonWater_InfoByName")
require("BossDungeonWater_GradeRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetBossDungeonWater_BossBattleUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Info = GetBossDungeonWater_InfoUis(ui:GetChild("Info"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.GradeRegion = GetBossDungeonWater_GradeRegionUis(ui:GetChild("GradeRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
