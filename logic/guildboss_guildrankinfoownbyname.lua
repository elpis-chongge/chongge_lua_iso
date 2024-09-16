require("CommonResource_HeadByName")

function GetGuildBoss_GuildRankInfoOwnUis(ui)
  local uis = {}
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.RankTxt = ui:GetChild("RankTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberWordTxt = ui:GetChild("NumberWordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
