require("CommonResource_BackGroundByName")
require("Team_TabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetTeam_TeamUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.AdjustmentBtn = ui:GetChild("AdjustmentBtn")
  uis.DeleteBtn = ui:GetChild("DeleteBtn")
  uis.TeamList = ui:GetChild("TeamList")
  uis.TabRegion = GetTeam_TabRegionUis(ui:GetChild("TabRegion"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
