require("Home_ExpProgressFillByName")

function GetHome_ExpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetHome_ExpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
