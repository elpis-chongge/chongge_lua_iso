require("DungeonInfo_RankNumberByName")

function GetDungeonInfo_RankUis(ui)
  local uis = {}
  uis.RankNumber = GetDungeonInfo_RankNumberUis(ui:GetChild("RankNumber"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
