require("Abyss_BossTipsDifficultyByName")
require("Abyss_BossTipsLock1ByName")
require("Abyss_BossTipsSpendByName")

function GetAbyss_BossTipsUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.RewardList = ui:GetChild("RewardList")
  uis.Difficulty = GetAbyss_BossTipsDifficultyUis(ui:GetChild("Difficulty"))
  uis.Lock = GetAbyss_BossTipsLock1Uis(ui:GetChild("Lock"))
  uis.Spend = GetAbyss_BossTipsSpendUis(ui:GetChild("Spend"))
  uis.c2Ctr = ui:GetController("c2")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
