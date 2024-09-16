require("Abyss_EventTipsByName")

function GetAbyss_EventTipsAniUis(ui)
  local uis = {}
  uis.EventTips = GetAbyss_EventTipsUis(ui:GetChild("EventTips"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
