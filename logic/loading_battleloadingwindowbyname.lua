require("Loading_EffectAniByName")

function GetLoading_BattleLoadingWindowUis(ui)
  local uis = {}
  uis.EffectAni = GetLoading_EffectAniUis(ui:GetChild("EffectAni"))
  uis.root = ui
  return uis
end
