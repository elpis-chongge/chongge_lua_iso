require("Badge_PartsCardBgByName")

function GetBadge_PartsCardUis(ui)
  local uis = {}
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.PartsCardBg = GetBadge_PartsCardBgUis(ui:GetChild("PartsCardBg"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
