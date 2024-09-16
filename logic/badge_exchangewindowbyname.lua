require("Badge_ExchangeByName")

function GetBadge_ExchangeWindowUis(ui)
  local uis = {}
  uis.Main = GetBadge_ExchangeUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
