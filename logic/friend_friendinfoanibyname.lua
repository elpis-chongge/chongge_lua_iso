require("Friend_FriendInfoByName")

function GetFriend_FriendInfoAniUis(ui)
  local uis = {}
  uis.FriendInfo = GetFriend_FriendInfoUis(ui:GetChild("FriendInfo"))
  uis.root = ui
  return uis
end
