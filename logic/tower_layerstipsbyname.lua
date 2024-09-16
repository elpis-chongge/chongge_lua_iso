require("Tower_LayersNowByName")
require("Tower_ProgressStripByName")
require("Tower_LayersLockByName")
require("Tower_LayersFutureByName")

function GetTower_LayersTipsUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.LayersNow = GetTower_LayersNowUis(ui:GetChild("LayersNow"))
  uis.ProgressStrip = GetTower_ProgressStripUis(ui:GetChild("ProgressStrip"))
  uis.LayersLock = GetTower_LayersLockUis(ui:GetChild("LayersLock"))
  uis.LayersFuture = GetTower_LayersFutureUis(ui:GetChild("LayersFuture"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
