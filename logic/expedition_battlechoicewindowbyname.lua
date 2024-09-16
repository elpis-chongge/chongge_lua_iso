require("Expedition_BattleChoiceByName")

function GetExpedition_BattleChoiceWindowUis(ui)
  local uis = {}
  uis.Main = GetExpedition_BattleChoiceUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
