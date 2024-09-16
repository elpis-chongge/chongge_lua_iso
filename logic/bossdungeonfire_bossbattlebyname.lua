require("CommonResource_BackGroundByName")
require("BossDungeonFire_InfoByName")
require("BossDungeonFire_GradeRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetBossDungeonFire_BossBattleUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Info = GetBossDungeonFire_InfoUis(ui:GetChild("Info"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.GradeRegion = GetBossDungeonFire_GradeRegionUis(ui:GetChild("GradeRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
