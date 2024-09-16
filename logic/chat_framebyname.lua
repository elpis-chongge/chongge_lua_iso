require("Chat_ChannelRegionByName")
require("Chat_InputWordByName")
require("Chat_WordListByName")

function GetChat_FrameUis(ui)
  local uis = {}
  uis.ChannelRegion = GetChat_ChannelRegionUis(ui:GetChild("ChannelRegion"))
  uis.LineBtn = ui:GetChild("LineBtn")
  uis.BanishBtn = ui:GetChild("BanishBtn")
  uis.InputWord = GetChat_InputWordUis(ui:GetChild("InputWord"))
  uis.EmojiBtn = ui:GetChild("EmojiBtn")
  uis.SendBtn = ui:GetChild("SendBtn")
  uis.WordList = GetChat_WordListUis(ui:GetChild("WordList"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
