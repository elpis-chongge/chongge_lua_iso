require("Card_StoryTitleByName")

function GetCard_DataModular1Uis(ui)
  local uis = {}
  uis.StoryTitle = GetCard_StoryTitleUis(ui:GetChild("StoryTitle"))
  uis.DataList = ui:GetChild("DataList")
  uis.root = ui
  return uis
end
