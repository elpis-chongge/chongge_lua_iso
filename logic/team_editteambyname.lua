require("CommonResource_BackGroundByName")
require("Team_InfoByName")
require("Team_NumberByName")
require("Team_OccupationRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetTeam_EditTeamUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Info = GetTeam_InfoUis(ui:GetChild("Info"))
  uis.Number = GetTeam_NumberUis(ui:GetChild("Number"))
  uis.TeamList = ui:GetChild("TeamList")
  uis.OccupationRegion = GetTeam_OccupationRegionUis(ui:GetChild("OccupationRegion"))
  uis.CancelBtn = ui:GetChild("CancelBtn")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.DeleteBtn = ui:GetChild("DeleteBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
