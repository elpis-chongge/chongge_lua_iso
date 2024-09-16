function GetGuild_Chat_infoUis(ui)
  local uis = {}
  
  uis.ChatList = ui:GetChild("ChatList")
  uis.NoticeTxt = ui:GetChild("NoticeTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
