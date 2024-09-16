require("GuildBoss_GuildCardAssistTipsPicByName")
require("CommonResource_CardBreachByName")
require("CommonResource_OccupationByName")

function GetGuildBoss_GuildCardAssistTipsUis(ui)
  local uis = {}
  uis.CardPic = GetGuildBoss_GuildCardAssistTipsPicUis(ui:GetChild("CardPic"))
  uis.StarList = ui:GetChild("StarList")
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
