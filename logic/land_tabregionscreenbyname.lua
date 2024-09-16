require("Land_TabRegionByName")

function GetLand_TabRegionScreenUis(ui)
  local uis = {}
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.TabRegion = GetLand_TabRegionUis(ui:GetChild("TabRegion"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
