require("Expedition_MapTipsAniByName")

function GetExpedition_Map4Uis(ui)
  local uis = {}
  uis.Tips1 = GetExpedition_MapTipsAniUis(ui:GetChild("Tips1"))
  uis.root = ui
  return uis
end
