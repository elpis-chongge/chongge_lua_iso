require("GuildTrain_RankOwnPlayerByName")

function GetGuildTrain_RankRegionUis(ui)
  local uis = {}
  uis.Time90Btn = ui:GetChild("Time90Btn")
  uis.Time180Btn = ui:GetChild("Time180Btn")
  uis.RankList = ui:GetChild("RankList")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.RankOwnPlayer = GetGuildTrain_RankOwnPlayerUis(ui:GetChild("RankOwnPlayer"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
