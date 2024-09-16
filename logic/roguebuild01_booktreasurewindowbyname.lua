require("RogueBuild01_BookTreasureByName")

function GetRogueBuild01_BookTreasureWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_BookTreasureUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
