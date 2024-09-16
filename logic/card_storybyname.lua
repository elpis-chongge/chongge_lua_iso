function GetCard_StoryUis(ui)
  local uis = {}
  
  uis.StoryList = ui:GetChild("StoryList")
  uis.root = ui
  return uis
end
