require("Abyss_ExpeditionReward2ByName")

function GetAbyss_ExpeditionRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_ExpeditionReward2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
