require("DungeonInfo_RankByName")

function GetDungeonInfo_RankAniUis(ui)
  local uis = {}
  uis.Rank = GetDungeonInfo_RankUis(ui:GetChild("Rank"))
  uis.root = ui
  return uis
end
