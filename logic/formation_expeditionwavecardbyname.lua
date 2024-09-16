require("Formation_ExpeditionWaveCardBgByName")

function GetFormation_ExpeditionWaveCardUis(ui)
  local uis = {}
  uis.HeadBg = GetFormation_ExpeditionWaveCardBgUis(ui:GetChild("HeadBg"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
