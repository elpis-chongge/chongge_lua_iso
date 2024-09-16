function GetChat_EmojiPicBtnUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.PicHolder = ui:GetChild("PicHolder")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
