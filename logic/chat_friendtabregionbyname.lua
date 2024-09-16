function GetChat_FriendTabRegionUis(ui)
  local uis = {}
  
  uis.TabList = ui:GetChild("TabList")
  uis.root = ui
  return uis
end
