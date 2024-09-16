require("CommonResource_BackGroundByName")
require("BossDungeonWood_InfoByName")
require("BossDungeonWood_GradeRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetBossDungeonWood_BossBattleUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Info = GetBossDungeonWood_InfoUis(ui:GetChild("Info"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.GradeRegion = GetBossDungeonWood_GradeRegionUis(ui:GetChild("GradeRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
