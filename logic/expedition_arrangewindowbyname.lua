require("Expedition_ArrangeByName")

function GetExpedition_ArrangeWindowUis(ui)
  local uis = {}
  uis.Main = GetExpedition_ArrangeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
