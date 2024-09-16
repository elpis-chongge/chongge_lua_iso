require("DungeonInfo_RankNumberByName")
require("DungeonInfo_PlayerATKByName")
require("DungeonInfo_PlayerTimeByName")

function GetDungeonInfo_PlayerInfoUis(ui)
  local uis = {}
  uis.RankNumber = GetDungeonInfo_RankNumberUis(ui:GetChild("RankNumber"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SendBtn = ui:GetChild("SendBtn")
  uis.CopyBtn = ui:GetChild("CopyBtn")
  uis.PlayBtn = ui:GetChild("PlayBtn")
  uis.PlayerATK = GetDungeonInfo_PlayerATKUis(ui:GetChild("PlayerATK"))
  uis.PlayerTime = GetDungeonInfo_PlayerTimeUis(ui:GetChild("PlayerTime"))
  uis.BadgeBtn = ui:GetChild("BadgeBtn")
  uis.HeadList = ui:GetChild("HeadList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
