require("Tower_SceneByName")
require("Tower_BattleListByName")
require("Tower_LockTipsByName")
require("CommonResource_CurrencyReturnByName")

function GetTower_TowerUis(ui)
  local uis = {}
  uis.Scene = GetTower_SceneUis(ui:GetChild("Scene"))
  uis.BattleList = GetTower_BattleListUis(ui:GetChild("BattleList"))
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.LockTips = GetTower_LockTipsUis(ui:GetChild("LockTips"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
