require("Card_StoryTitleByName")

function GetCard_DataModular2_LockUis(ui)
  local uis = {}
  uis.StoryTitle = GetCard_StoryTitleUis(ui:GetChild("StoryTitle"))
  uis.root = ui
  return uis
end
