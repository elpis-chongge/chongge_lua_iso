require("Chat_FriendTabRegionByName")

function GetChat_PlayerListUis(ui)
  local uis = {}
  uis.BanishList = ui:GetChild("BanishList")
  uis.FriendList = ui:GetChild("FriendList")
  uis.FriendTabRegion = GetChat_FriendTabRegionUis(ui:GetChild("FriendTabRegion"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
