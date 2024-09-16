require("CommonResource_BackGroundByName")
require("TeamCardChoice_InfoByName")
require("TeamCardChoice_NumberByName")
require("TeamCardChoice_OccupationRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetTeamCardChoice_EditTeamUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Info = GetTeamCardChoice_InfoUis(ui:GetChild("Info"))
  uis.Number = GetTeamCardChoice_NumberUis(ui:GetChild("Number"))
  uis.TeamList = ui:GetChild("TeamList")
  uis.OccupationRegion = GetTeamCardChoice_OccupationRegionUis(ui:GetChild("OccupationRegion"))
  uis.CancelBtn = ui:GetChild("CancelBtn")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.DeleteBtn = ui:GetChild("DeleteBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
