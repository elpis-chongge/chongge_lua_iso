require("Guild_CaptainPicByName")
require("Guild_PositionByName")
require("Guild_VoteTipsByName")

function GetGuild_Captain_infoUis(ui)
  local uis = {}
  uis.CaptainPic = GetGuild_CaptainPicUis(ui:GetChild("CaptainPic"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.Position = GetGuild_PositionUis(ui:GetChild("Position"))
  uis.ImpeachmentBtn = ui:GetChild("ImpeachmentBtn")
  uis.VoteTips = GetGuild_VoteTipsUis(ui:GetChild("VoteTips"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
