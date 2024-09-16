require("BossDungeon_BossTipsByName")

function GetBossDungeon_BossTipsAniUis(ui)
  local uis = {}
  uis.BossTips = GetBossDungeon_BossTipsUis(ui:GetChild("BossTips"))
  uis.root = ui
  return uis
end
