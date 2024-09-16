require("Formation_ExpeditionWaveCardByName")

function GetFormation_ExpeditionWaveCardAniUis(ui)
  local uis = {}
  uis.Card = GetFormation_ExpeditionWaveCardUis(ui:GetChild("Card"))
  uis.root = ui
  return uis
end
