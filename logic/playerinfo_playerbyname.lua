require("CommonResource_BackGroundByName")
require("PlayerInfo_CardShowByName")
require("PlayerInfo_LeftByName")
require("PlayerInfo_RightByName")

function GetPlayerInfo_PlayerUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CardShow = GetPlayerInfo_CardShowUis(ui:GetChild("CardShow"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.Left = GetPlayerInfo_LeftUis(ui:GetChild("Left"))
  uis.Right = GetPlayerInfo_RightUis(ui:GetChild("Right"))
  uis.CodeBtn = ui:GetChild("CodeBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
