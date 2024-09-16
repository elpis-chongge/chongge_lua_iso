function GetChat_ChannelListUis(ui)
  local uis = {}
  
  uis.ChannelList = ui:GetChild("ChannelList")
  uis.root = ui
  return uis
end
