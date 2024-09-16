require("Badge_LevelUpTipsByName")

function GetBadge_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetBadge_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
