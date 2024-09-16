require("Abyss_Super_ProgressLockByName")

function GetAbyss_BuildTipsUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Lock = GetAbyss_Super_ProgressLockUis(ui:GetChild("Lock"))
  uis.IconList = ui:GetChild("IconList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
