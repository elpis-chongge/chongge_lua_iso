require("CommonResource_RedDotByName")

function GetGuildBoss_GuildBossRankBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.RankTxt = ui:GetChild("RankTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
