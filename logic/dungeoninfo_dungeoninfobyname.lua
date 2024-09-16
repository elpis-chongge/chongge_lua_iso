require("DungeonInfo_DungeonInfoTipsByName")

function GetDungeonInfo_DungeonInfoUis(ui)
  local uis = {}
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.DungeonInfoTips = GetDungeonInfo_DungeonInfoTipsUis(ui:GetChild("DungeonInfoTips"))
  uis.root = ui
  return uis
end
