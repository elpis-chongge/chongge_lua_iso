require("Badge_LevelUpItemWordByName")
require("CommonResource_AssetsTipsByName")
require("Badge_UpGoldSpendByName")
require("Badge_LevelUpMaxByName")

function GetBadge_LevelUpListUis(ui)
  local uis = {}
  uis.BadgeList = ui:GetChild("BadgeList")
  uis.Word = GetBadge_LevelUpItemWordUis(ui:GetChild("Word"))
  uis.AssetsTips = GetCommonResource_AssetsTipsUis(ui:GetChild("AssetsTips"))
  uis.DecomposeBtn = ui:GetChild("DecomposeBtn")
  uis.UpGoldSpend = GetBadge_UpGoldSpendUis(ui:GetChild("UpGoldSpend"))
  uis.ClearBtn = ui:GetChild("ClearBtn")
  uis.UpBtn = ui:GetChild("UpBtn")
  uis.Max = GetBadge_LevelUpMaxUis(ui:GetChild("Max"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
