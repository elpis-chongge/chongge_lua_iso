require("Chat_ChannelListByName")
require("Chat_PrivateListByName")

function GetChat_ChannelRegionUis(ui)
  local uis = {}
  uis.ChannelList = GetChat_ChannelListUis(ui:GetChild("ChannelList"))
  uis.PrivateList = GetChat_PrivateListUis(ui:GetChild("PrivateList"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
