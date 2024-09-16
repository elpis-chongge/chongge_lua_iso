require("Abyss_DetailsTipsTitleByName")

function GetAbyss_DetailsTipsTitleAniUis(ui)
  local uis = {}
  uis.DetailsTipsTitle = GetAbyss_DetailsTipsTitleUis(ui:GetChild("DetailsTipsTitle"))
  uis.root = ui
  return uis
end
