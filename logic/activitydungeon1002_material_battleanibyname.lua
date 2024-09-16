require("ActivityDungeon1002_Material_BattleByName")

function GetActivityDungeon1002_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1002_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
