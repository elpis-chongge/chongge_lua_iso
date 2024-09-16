require("Expedition_Expedition1ByName")

function GetExpedition_Expedition2Uis(ui)
  local uis = {}
  uis.Expedition1 = GetExpedition_Expedition1Uis(ui:GetChild("Expedition1"))
  uis.root = ui
  return uis
end
