require("Expedition_ArrangeTips2_1ByName")

function GetExpedition_ArrangeTips2Uis(ui)
  local uis = {}
  uis.Title = GetExpedition_ArrangeTips2_1Uis(ui:GetChild("Title"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.root = ui
  return uis
end
