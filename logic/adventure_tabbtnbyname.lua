require("CommonResource_RedDotByName")
require("CommonResource_ArenaNewSeasonByName")
require("CommonResource_ArenaTimeByName")

function GetAdventure_TabBtnUis(ui)
  local uis = {}
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.ArenaNewSeason = GetCommonResource_ArenaNewSeasonUis(ui:GetChild("ArenaNewSeason"))
  uis.ArenaTime = GetCommonResource_ArenaTimeUis(ui:GetChild("ArenaTime"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.ArenaNewSeasonCtr = ui:GetController("ArenaNewSeason")
  uis.ArenaTimeCtr = ui:GetController("ArenaTime")
  uis.root = ui
  return uis
end
