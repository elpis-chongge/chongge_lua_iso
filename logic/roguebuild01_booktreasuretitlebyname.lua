require("RogueBuild01_BookTreasureGetByName")

function GetRogueBuild01_BookTreasureTitleUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.GetTips = GetRogueBuild01_BookTreasureGetUis(ui:GetChild("GetTips"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
