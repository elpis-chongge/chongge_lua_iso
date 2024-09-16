require("Abyss_DetailsTipsByName")

function GetAbyss_DetailsTipsAniUis(ui)
  local uis = {}
  uis.DetailsTips = GetAbyss_DetailsTipsUis(ui:GetChild("DetailsTips"))
  uis.root = ui
  return uis
end
