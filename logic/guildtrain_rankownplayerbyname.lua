require("GuildTrain_RankNumberByName")
require("CommonResource_HeadByName")

function GetGuildTrain_RankOwnPlayerUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.RankNumber = GetGuildTrain_RankNumberUis(ui:GetChild("RankNumber"))
  uis.LookBtn = ui:GetChild("LookBtn")
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
