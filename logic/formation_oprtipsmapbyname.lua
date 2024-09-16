require("Formation_LockTipsByName")

function GetFormation_OprTipsMapUis(ui)
  local uis = {}
  uis.MapList = ui:GetChild("MapList")
  uis.ContentList = ui:GetChild("ContentList")
  uis.UseBtn = ui:GetChild("UseBtn")
  uis.LockTips = GetFormation_LockTipsUis(ui:GetChild("LockTips"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
