require("GuildBoss_CompensateCardHeadBgByName")
require("CommonResource_OccupationByName")

function GetGuildBoss_CompensateCardHeadBtnUis(ui)
  local uis = {}
  uis.CardPic = GetGuildBoss_CompensateCardHeadBgUis(ui:GetChild("CardPic"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
