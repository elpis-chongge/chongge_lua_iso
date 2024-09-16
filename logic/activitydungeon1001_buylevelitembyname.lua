require("ActivityDungeon1001_PassReward_AllFrame_EByName")

function GetActivityDungeon1001_BuyLevelItemUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1001_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
