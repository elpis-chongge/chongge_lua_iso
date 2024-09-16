require("Badge_ExpProgressFillByName")

function GetBadge_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBadge_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
