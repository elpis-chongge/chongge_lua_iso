require("RogueBuild01_BookTreasureChoice2ByName")
require("RogueBuild01_BookTreasureChoice3ByName")

function GetRogueBuild01_ItemLook_TreasureChoiceUis(ui)
  local uis = {}
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.Choice2 = GetRogueBuild01_BookTreasureChoice2Uis(ui:GetChild("Choice2"))
  uis.Choice3 = GetRogueBuild01_BookTreasureChoice3Uis(ui:GetChild("Choice3"))
  uis.ResetBtn = ui:GetChild("ResetBtn")
  uis.root = ui
  return uis
end
