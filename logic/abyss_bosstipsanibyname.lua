require("Abyss_BossTipsByName")

function GetAbyss_BossTipsAniUis(ui)
  local uis = {}
  uis.BossTips = GetAbyss_BossTipsUis(ui:GetChild("BossTips"))
  uis.root = ui
  return uis
end
