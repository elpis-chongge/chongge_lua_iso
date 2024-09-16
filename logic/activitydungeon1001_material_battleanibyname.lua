require("ActivityDungeon1001_Material_BattleByName")

function GetActivityDungeon1001_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1001_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
