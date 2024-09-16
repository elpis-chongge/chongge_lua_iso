require("RogueBuild01_DifficultyLook_EffectByName")

function GetRogueBuild01_DifficultyLook_EffectAniUis(ui)
  local uis = {}
  uis.Effect = GetRogueBuild01_DifficultyLook_EffectUis(ui:GetChild("Effect"))
  uis.root = ui
  return uis
end
