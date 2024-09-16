require("BossDungeon_HpFillByName")

function GetBossDungeon_HpBarUis(ui)
  local uis = {}
  uis.bar = GetBossDungeon_HpFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
