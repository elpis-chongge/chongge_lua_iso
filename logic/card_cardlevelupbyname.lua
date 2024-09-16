require("Card_LevelUp1ByName")
require("Card_LevelUp3ByName")
require("Card_LevelUp2ByName")

function GetCard_CardLevelUpUis(ui)
  local uis = {}
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.LevelUp1 = GetCard_LevelUp1Uis(ui:GetChild("LevelUp1"))
  uis.LevelUp3 = GetCard_LevelUp3Uis(ui:GetChild("LevelUp3"))
  uis.LevelUp2 = GetCard_LevelUp2Uis(ui:GetChild("LevelUp2"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.root = ui
  return uis
end
