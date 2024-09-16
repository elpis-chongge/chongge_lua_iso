require("Friend_FriendByName")

function GetFriend_FriendWindowUis(ui)
  local uis = {}
  uis.Main = GetFriend_FriendUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
