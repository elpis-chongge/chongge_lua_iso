require("Expedition_ReviewTips2_4ByName")

function GetExpedition_ReviewTips2Uis(ui)
  local uis = {}
  uis.Wave1 = GetExpedition_ReviewTips2_4Uis(ui:GetChild("Wave1"))
  uis.Wave2 = GetExpedition_ReviewTips2_4Uis(ui:GetChild("Wave2"))
  uis.root = ui
  return uis
end
