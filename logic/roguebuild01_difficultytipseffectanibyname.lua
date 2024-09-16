require("RogueBuild01_DifficultyTipsEffectByName")

function GetRogueBuild01_DifficultyTipsEffectAniUis(ui)
  local uis = {}
  uis.Effect = GetRogueBuild01_DifficultyTipsEffectUis(ui:GetChild("Effect"))
  uis.root = ui
  return uis
end
