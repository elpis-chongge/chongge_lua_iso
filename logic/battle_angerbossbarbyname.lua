require("Battle_AngerBossFillByName")

function GetBattle_AngerBossBarUis(ui)
  local uis = {}
  uis.bar = GetBattle_AngerBossFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
