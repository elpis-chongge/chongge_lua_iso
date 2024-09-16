require("SuperDungeon_RewardItemProgressByName")

function GetSuperDungeon_RewardItemUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.ItemList = ui:GetChild("ItemList")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.Progress = GetSuperDungeon_RewardItemProgressUis(ui:GetChild("Progress"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
