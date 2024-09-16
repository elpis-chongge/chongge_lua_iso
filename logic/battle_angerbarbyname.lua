require("Battle_AngerFillByName")

function GetBattle_AngerBarUis(ui)
  local uis = {}
  uis.bar = GetBattle_AngerFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
