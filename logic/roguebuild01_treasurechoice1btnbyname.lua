require("RogueBuild01_TreasureChoiceBgByName")

function GetRogueBuild01_TreasureChoice1BtnUis(ui)
  local uis = {}
  uis.Bg = GetRogueBuild01_TreasureChoiceBgUis(ui:GetChild("Bg"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
