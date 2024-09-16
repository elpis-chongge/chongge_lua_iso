require("Tower_RewardCompleteByName")
require("Tower_RewardLockByName")

function GetTower_RewardTipsUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Name1Txt = ui:GetChild("Name1Txt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.RewardTxt = ui:GetChild("RewardTxt")
  uis.Complete = GetTower_RewardCompleteUis(ui:GetChild("Complete"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Lock = GetTower_RewardLockUis(ui:GetChild("Lock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
