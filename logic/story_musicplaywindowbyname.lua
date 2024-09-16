require("Story_MusicPlayByName")

function GetStory_MusicPlayWindowUis(ui)
  local uis = {}
  uis.Main = GetStory_MusicPlayUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
