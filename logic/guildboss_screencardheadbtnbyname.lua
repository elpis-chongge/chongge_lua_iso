require("GuildBoss_ScreenCardHeadBgByName")
require("CommonResource_OccupationByName")
require("GuildBoss_ScreenCardStateByName")

function GetGuildBoss_ScreenCardHeadBtnUis(ui)
  local uis = {}
  uis.CardPic = GetGuildBoss_ScreenCardHeadBgUis(ui:GetChild("CardPic"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.State = GetGuildBoss_ScreenCardStateUis(ui:GetChild("State"))
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
