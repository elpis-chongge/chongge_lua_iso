require("CommonResource_OccupationByName")
require("Battle_BurstCardHeadWordByName")

function GetBattle_BurstCardHeadUis(ui)
  local uis = {}
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.BurstCardHeadWord = GetBattle_BurstCardHeadWordUis(ui:GetChild("BurstCardHeadWord"))
  uis.BurstCardHeadProgressBar = ui:GetChild("BurstCardHeadProgressBar")
  uis.c2Ctr = ui:GetController("c2")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
