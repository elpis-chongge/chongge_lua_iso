require("Chat_PrivateTipsWordByName")
require("Chat_AddTargetByName")

function GetChat_WordListUis(ui)
  local uis = {}
  uis.OtherWordList = ui:GetChild("OtherWordList")
  uis.PrivateTipsWord = GetChat_PrivateTipsWordUis(ui:GetChild("PrivateTipsWord"))
  uis.PrivateWordList = ui:GetChild("PrivateWordList")
  uis.TipsTxt = GetChat_AddTargetUis(ui:GetChild("TipsTxt"))
  uis.GulidNoticeBtn = ui:GetChild("GulidNoticeBtn")
  uis.GuildWordList = ui:GetChild("GuildWordList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
