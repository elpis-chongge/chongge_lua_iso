require("Expedition_BuffTipsByName")

function GetExpedition_BuffTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetExpedition_BuffTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
