require("ActivityDungeon1_PassReward_AllFrame_EByName")

function GetActivityDungeon1_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
