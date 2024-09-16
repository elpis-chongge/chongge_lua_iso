require("Guild_PlayerPicByName")
require("Guild_PositionByName")
require("Guild_PlayerOnlineByName")

function GetGuild_PlayerInfoUis(ui)
  local uis = {}
  uis.PlayerPic = GetGuild_PlayerPicUis(ui:GetChild("PlayerPic"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.Position = GetGuild_PositionUis(ui:GetChild("Position"))
  uis.PlayerOnline = GetGuild_PlayerOnlineUis(ui:GetChild("PlayerOnline"))
  uis.RefuseBtn = ui:GetChild("RefuseBtn")
  uis.AdoptBtn = ui:GetChild("AdoptBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
