require("CommonResource_HeadByName")

function GetArena_RecordTipsUis(ui)
  local uis = {}
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.ResultTxt = ui:GetChild("ResultTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.GuildTxt = ui:GetChild("GuildTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.TimeAxisBtn = ui:GetChild("TimeAxisBtn")
  uis.DataBtn = ui:GetChild("DataBtn")
  uis.PlayBackBtn = ui:GetChild("PlayBackBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
