require("DungeonInfo_BossHpByName")

function GetDungeonInfo_BossInfoUis(ui)
  local uis = {}
  uis.BossHp = GetDungeonInfo_BossHpUis(ui:GetChild("BossHp"))
  uis.RankList = ui:GetChild("RankList")
  uis.root = ui
  return uis
end
