require("Abyss_DetailsTipsLineByName")

function GetAbyss_DetailsTipsLineAniUis(ui)
  local uis = {}
  uis.DetailsTipsLine = GetAbyss_DetailsTipsLineUis(ui:GetChild("DetailsTipsLine"))
  uis.root = ui
  return uis
end
