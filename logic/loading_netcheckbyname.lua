require("CommonResource_PopupBgByName")
require("Loading_EffectAniByName")

function GetLoading_NetCheckUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.EffectAni = GetLoading_EffectAniUis(ui:GetChild("EffectAni"))
  uis.root = ui
  return uis
end
