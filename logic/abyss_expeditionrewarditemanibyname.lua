require("Abyss_ExpeditionRewardItemByName")

function GetAbyss_ExpeditionRewardItemAniUis(ui)
  local uis = {}
  uis.Item = GetAbyss_ExpeditionRewardItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
