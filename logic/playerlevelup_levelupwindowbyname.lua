require("PlayerLevelUp_LevelUpByName")

function GetPlayerLevelUp_LevelUpWindowUis(ui)
  local uis = {}
  uis.Main = GetPlayerLevelUp_LevelUpUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
