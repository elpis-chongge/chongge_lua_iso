require("RogueBuild01_BookTreasureGetByName")

function GetRogueBuild01_BookSacredTitleUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.GetTips = GetRogueBuild01_BookTreasureGetUis(ui:GetChild("GetTips"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
