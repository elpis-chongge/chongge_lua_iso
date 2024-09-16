require("Abyss_BuildTipsByName")

function GetAbyss_BuildTipsAniUis(ui)
  local uis = {}
  uis.BuildTips = GetAbyss_BuildTipsUis(ui:GetChild("BuildTips"))
  uis.root = ui
  return uis
end
