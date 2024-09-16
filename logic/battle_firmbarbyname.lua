require("Battle_FirmFillByName")

function GetBattle_FirmBarUis(ui)
  local uis = {}
  uis.bar = GetBattle_FirmFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
