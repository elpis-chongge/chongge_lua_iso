require("Abyss_BossTopInfoByName")
require("Abyss_BossTipsTitleByName")

function GetAbyss_BossRegionUis(ui)
  local uis = {}
  uis.BossTopInfo = GetAbyss_BossTopInfoUis(ui:GetChild("BossTopInfo"))
  uis.Title = GetAbyss_BossTipsTitleUis(ui:GetChild("Title"))
  uis.TabList = ui:GetChild("TabList")
  uis.TipsList = ui:GetChild("TipsList")
  uis.root = ui
  return uis
end
