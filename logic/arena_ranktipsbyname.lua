require("CommonResource_HeadByName")

function GetArena_RankTipsUis(ui)
  local uis = {}
  uis.RankTxt = ui:GetChild("RankTxt")
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.GuildTxt = ui:GetChild("GuildTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.GloryList = ui:GetChild("GloryList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
