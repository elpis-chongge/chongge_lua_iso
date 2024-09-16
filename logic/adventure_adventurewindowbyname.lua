require("Adventure_AdventureByName")

function GetAdventure_AdventureWindowUis(ui)
  local uis = {}
  uis.Main = GetAdventure_AdventureUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
