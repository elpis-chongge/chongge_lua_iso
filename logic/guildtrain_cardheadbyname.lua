require("GuildTrain_CardHeadBgByName")
require("CommonResource_OccupationByName")
require("CommonResource_CardBreachByName")

function GetGuildTrain_CardHeadUis(ui)
  local uis = {}
  uis.PicMask = GetGuildTrain_CardHeadBgUis(ui:GetChild("PicMask"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.StarList = ui:GetChild("StarList")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
