require("Abyss_Super_ProgressStarByName")
require("Abyss_Super_ProgressLockByName")

function GetAbyss_Super_ProgressUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Star = GetAbyss_Super_ProgressStarUis(ui:GetChild("Star"))
  uis.Lock = GetAbyss_Super_ProgressLockUis(ui:GetChild("Lock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
