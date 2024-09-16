require("Card_LevelUp4ByName")

function GetCard_LevelUp2Uis(ui)
  local uis = {}
  uis.ItemSpend1Btn = ui:GetChild("ItemSpend1Btn")
  uis.ItemSpend2Btn = ui:GetChild("ItemSpend2Btn")
  uis.LevelUpBtn = ui:GetChild("LevelUpBtn")
  uis.LevelUp4 = GetCard_LevelUp4Uis(ui:GetChild("LevelUp4"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
