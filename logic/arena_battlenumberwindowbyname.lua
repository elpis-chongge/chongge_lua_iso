require("Arena_BattleNumber2ByName")

function GetArena_BattleNumberWindowUis(ui)
  local uis = {}
  uis.Main = GetArena_BattleNumber2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
