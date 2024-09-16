require("Expedition_MapTipsAniByName")

function GetExpedition_Map3Uis(ui)
  local uis = {}
  uis.Tips1 = GetExpedition_MapTipsAniUis(ui:GetChild("Tips1"))
  uis.Tips2 = GetExpedition_MapTipsAniUis(ui:GetChild("Tips2"))
  uis.Tips3 = GetExpedition_MapTipsAniUis(ui:GetChild("Tips3"))
  uis.root = ui
  return uis
end
