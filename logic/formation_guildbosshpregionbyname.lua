require("CommonResource_OccupationByName")
require("Formation_GuildBossHPHeadByName")

function GetFormation_GuildBossHPRegionUis(ui)
  local uis = {}
  uis.HPProgressBar = ui:GetChild("HPProgressBar")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.Head = GetFormation_GuildBossHPHeadUis(ui:GetChild("Head"))
  uis.root = ui
  return uis
end
