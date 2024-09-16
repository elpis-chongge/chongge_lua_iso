require("Expedition_Expedition2ByName")

function GetExpedition_ExpeditionWindowUis(ui)
  local uis = {}
  uis.Main = GetExpedition_Expedition2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
