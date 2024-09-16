require("Tower_LayersTipsByName")

function GetTower_LayersTipsAniUis(ui)
  local uis = {}
  uis.LayersTips = GetTower_LayersTipsUis(ui:GetChild("LayersTips"))
  uis.root = ui
  return uis
end
