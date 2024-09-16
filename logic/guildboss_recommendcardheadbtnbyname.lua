require("GuildBoss_RecommendCardHeadBgByName")
require("CommonResource_OccupationByName")
require("CommonResource_CardBreachByName")
require("GuildBoss_RecommendCardStateByName")

function GetGuildBoss_RecommendCardHeadBtnUis(ui)
  local uis = {}
  uis.CardPic = GetGuildBoss_RecommendCardHeadBgUis(ui:GetChild("CardPic"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.StarList = ui:GetChild("StarList")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.Breach = GetCommonResource_CardBreachUis(ui:GetChild("Breach"))
  uis.State = GetGuildBoss_RecommendCardStateUis(ui:GetChild("State"))
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
