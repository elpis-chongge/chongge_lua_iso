require("Battle_BattleUIByName")

function GetBattle_BattleUIWindowUis(ui)
  local uis = {}
  uis.Main = GetBattle_BattleUIUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
