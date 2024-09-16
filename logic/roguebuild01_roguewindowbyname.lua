require("RogueBuild01_RogueByName")

function GetRogueBuild01_RogueWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_RogueUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
