require("Abyss_ExpeditionLayerByName")
require("Abyss_ExpeditionCompleteByName")
require("Abyss_ExpeditionLockByName")
require("Abyss_ExpeditionTimeByName")

function GetAbyss_ExpeditionRegionUis(ui)
  local uis = {}
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ExpeditionLayer = GetAbyss_ExpeditionLayerUis(ui:GetChild("ExpeditionLayer"))
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.Complete = GetAbyss_ExpeditionCompleteUis(ui:GetChild("Complete"))
  uis.Lock = GetAbyss_ExpeditionLockUis(ui:GetChild("Lock"))
  uis.Time = GetAbyss_ExpeditionTimeUis(ui:GetChild("Time"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
