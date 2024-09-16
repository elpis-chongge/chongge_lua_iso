require("Chat_EmojiTypePicByName")

function GetChat_EmojiTypeBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.EmojiTypePic = GetChat_EmojiTypePicUis(ui:GetChild("EmojiTypePic"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
