require("Formation_RoundStripOcpHeadBgByName")
require("CommonResource_OccupationByName")

function GetFormation_RoundStripOcpHeadUis(ui)
  local uis = {}
  uis.HeadBg = GetFormation_RoundStripOcpHeadBgUis(ui:GetChild("HeadBg"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.root = ui
  return uis
end
