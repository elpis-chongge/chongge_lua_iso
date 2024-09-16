require("Formation_ExpeditionWaveCardListByName")

function GetFormation_ExpeditionWaveUis(ui)
  local uis = {}
  uis.CardList = GetFormation_ExpeditionWaveCardListUis(ui:GetChild("CardList"))
  uis.Wave1Btn = ui:GetChild("Wave1Btn")
  uis.Wave2Btn = ui:GetChild("Wave2Btn")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
