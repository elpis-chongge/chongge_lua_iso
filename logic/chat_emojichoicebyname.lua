function GetChat_EmojiChoiceUis(ui)
  local uis = {}
  
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PicList = ui:GetChild("PicList")
  uis.TypeList = ui:GetChild("TypeList")
  uis.root = ui
  return uis
end
