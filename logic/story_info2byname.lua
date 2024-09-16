require("Story_LevelByName")

function GetStory_Info2Uis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Level = GetStory_LevelUis(ui:GetChild("Level"))
  uis.root = ui
  return uis
end
