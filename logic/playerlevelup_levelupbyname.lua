require("PlayerLevelUp_EffectByName")

function GetPlayerLevelUp_LevelUpUis(ui)
  local uis = {}
  uis.Effect = GetPlayerLevelUp_EffectUis(ui:GetChild("Effect"))
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.ContentList = ui:GetChild("ContentList")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
