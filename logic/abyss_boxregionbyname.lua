require("Abyss_BoxTopInfoByName")

function GetAbyss_BoxRegionUis(ui)
  local uis = {}
  uis.BoxTopInfo = GetAbyss_BoxTopInfoUis(ui:GetChild("BoxTopInfo"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.TabList = ui:GetChild("TabList")
  uis.root = ui
  return uis
end
