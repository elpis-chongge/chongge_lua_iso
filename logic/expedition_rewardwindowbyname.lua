require("Expedition_RewardByName")

function GetExpedition_RewardWindowUis(ui)
  local uis = {}
  uis.Main = GetExpedition_RewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
