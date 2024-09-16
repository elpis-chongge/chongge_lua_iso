require("Story_CGShowByName")

function GetStory_CGShowWindowUis(ui)
  local uis = {}
  uis.Main = GetStory_CGShowUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
