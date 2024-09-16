require("Badge_ExpAddProgressFillByName")

function GetBadge_ExpAddProgressBarUis(ui)
  local uis = {}
  uis.bar = GetBadge_ExpAddProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
