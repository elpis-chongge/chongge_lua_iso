require("Story_StoryByName")

function GetStory_StoryWindowUis(ui)
  local uis = {}
  uis.Main = GetStory_StoryUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
