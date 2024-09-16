require("CommonResource_BackGroundByName")
require("Arena_BattleInfoByName")
require("Arena_MyRankByName")
require("Arena_TimeByName")
require("Arena_LockEntryByName")
require("CommonResource_CurrencyReturnByName")

function GetArena_ArenaUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.BattleInfo = GetArena_BattleInfoUis(ui:GetChild("BattleInfo"))
  uis.MyRank = GetArena_MyRankUis(ui:GetChild("MyRank"))
  uis.Time = GetArena_TimeUis(ui:GetChild("Time"))
  uis.LockEntry = GetArena_LockEntryUis(ui:GetChild("LockEntry"))
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.RankBtn = ui:GetChild("RankBtn")
  uis.DefenseBtn = ui:GetChild("DefenseBtn")
  uis.RecordBtn = ui:GetChild("RecordBtn")
  uis.RefreshBtn = ui:GetChild("RefreshBtn")
  uis.BuyNumberBtn = ui:GetChild("BuyNumberBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
