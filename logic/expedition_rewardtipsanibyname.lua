require("Expedition_RewardTipsByName")

function GetExpedition_RewardTipsAniUis(ui)
  local uis = {}
  uis.RewardTips = GetExpedition_RewardTipsUis(ui:GetChild("RewardTips"))
  uis.root = ui
  return uis
end
