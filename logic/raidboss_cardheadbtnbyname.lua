require("RaidBoss_CardHeadBgByName")
require("CommonResource_OccupationByName")

function GetRaidBoss_CardHeadBtnUis(ui)
  local uis = {}
  uis.CardPic = GetRaidBoss_CardHeadBgUis(ui:GetChild("CardPic"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
