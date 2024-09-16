require("Abyss_BoxTipsByName")

function GetAbyss_BoxTipsAniUis(ui)
  local uis = {}
  uis.BoxTips = GetAbyss_BoxTipsUis(ui:GetChild("BoxTips"))
  uis.root = ui
  return uis
end
