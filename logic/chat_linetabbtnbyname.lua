require("Chat_LineTabBtnBgByName")

function GetChat_LineTabBtnUis(ui)
  local uis = {}
  uis.ChannelBtnBg = GetChat_LineTabBtnBgUis(ui:GetChild("ChannelBtnBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
