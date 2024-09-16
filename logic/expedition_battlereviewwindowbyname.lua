require("Expedition_BattleReviewByName")

function GetExpedition_BattleReviewWindowUis(ui)
  local uis = {}
  uis.Main = GetExpedition_BattleReviewUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
