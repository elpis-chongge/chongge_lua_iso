require("CommonResource_HeadByName")
require("PlayerInfo_TimeByName")
require("PlayerInfo_LevelByName")
require("PlayerInfo_GuildByName")
require("PlayerInfo_CardNumberByName")

function GetPlayerInfo_LeftUis(ui)
  local uis = {}
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.Time = GetPlayerInfo_TimeUis(ui:GetChild("Time"))
  uis.NameBtn = ui:GetChild("NameBtn")
  uis.Level = GetPlayerInfo_LevelUis(ui:GetChild("Level"))
  uis.Guild = GetPlayerInfo_GuildUis(ui:GetChild("Guild"))
  uis.CardNumber = GetPlayerInfo_CardNumberUis(ui:GetChild("CardNumber"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
