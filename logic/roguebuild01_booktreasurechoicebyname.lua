require("RogueBuild01_BookTreasureChoice1ByName")
require("RogueBuild01_BookTreasureChoice2ByName")
require("RogueBuild01_BookTreasureChoice3ByName")

function GetRogueBuild01_BookTreasureChoiceUis(ui)
  local uis = {}
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.Choice1 = GetRogueBuild01_BookTreasureChoice1Uis(ui:GetChild("Choice1"))
  uis.Choice2 = GetRogueBuild01_BookTreasureChoice2Uis(ui:GetChild("Choice2"))
  uis.Choice3 = GetRogueBuild01_BookTreasureChoice3Uis(ui:GetChild("Choice3"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.ResetBtn = ui:GetChild("ResetBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
