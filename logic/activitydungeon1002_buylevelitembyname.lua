require("ActivityDungeon1002_PassReward_AllFrame_EByName")

function GetActivityDungeon1002_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1002_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
