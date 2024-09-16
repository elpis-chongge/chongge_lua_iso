require("Badge_LevelUpInfoByName")
require("Badge_LevelUpListByName")

function GetBadge_BadgeLevelUpUis(ui)
  local uis = {}
  uis.LevelUpInfo = GetBadge_LevelUpInfoUis(ui:GetChild("LevelUpInfo"))
  uis.LevelUpList = GetBadge_LevelUpListUis(ui:GetChild("LevelUpList"))
  uis.root = ui
  return uis
end
