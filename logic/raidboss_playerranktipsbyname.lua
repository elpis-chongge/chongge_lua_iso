require("RaidBoss_PlayerNumberByName")
require("CommonResource_HeadByName")

function GetRaidBoss_PlayerRankTipsUis(ui)
  local uis = {}
  uis.PlayerNumber = GetRaidBoss_PlayerNumberUis(ui:GetChild("PlayerNumber"))
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.GuildTxt = ui:GetChild("GuildTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.NumberWordTxt = ui:GetChild("NumberWordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.PlayerLookBtn = ui:GetChild("PlayerLookBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
