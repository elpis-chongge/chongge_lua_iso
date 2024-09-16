require("ActivityDungeon1_Material_BattleByName")

function GetActivityDungeon1_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
