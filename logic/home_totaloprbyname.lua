function GetHome_TotalOprUis(ui)
  local uis = {}
  
  uis.PlayerInfoBtn = ui:GetChild("PlayerInfoBtn")
  uis.SetBtn = ui:GetChild("SetBtn")
  uis.ChatBtn = ui:GetChild("ChatBtn")
  uis.FriendBtn = ui:GetChild("FriendBtn")
  uis.CodeBtn = ui:GetChild("CodeBtn")
  uis.root = ui
  return uis
end
