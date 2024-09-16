require("AbyssReward_LockByName")
require("AbyssReward_CompleteByName")

function GetAbyssReward_RewardTipsUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.RewardTxt = ui:GetChild("RewardTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.Lock = GetAbyssReward_LockUis(ui:GetChild("Lock"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Complete = GetAbyssReward_CompleteUis(ui:GetChild("Complete"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
