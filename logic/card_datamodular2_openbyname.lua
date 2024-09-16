require("Card_StoryTitleByName")

function GetCard_DataModular2_OpenUis(ui)
  local uis = {}
  uis.WordList = ui:GetChild("WordList")
  uis.StoryTitle = GetCard_StoryTitleUis(ui:GetChild("StoryTitle"))
  uis.root = ui
  return uis
end
