require("RogueBuild01_BookSacredTitleByName")
require("RogueBuild01_BookSacredInfoByName")

function GetRogueBuild01_BookSacredTipsUis(ui)
  local uis = {}
  uis.Title = GetRogueBuild01_BookSacredTitleUis(ui:GetChild("Title"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.Info = GetRogueBuild01_BookSacredInfoUis(ui:GetChild("Info"))
  uis.root = ui
  return uis
end
