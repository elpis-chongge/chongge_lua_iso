require("ActivityDungeon1_PassReward_AllFrame_EByName")

function GetActivityDungeon1_PassReward_EndTwoUis(ui)
  local uis = {}
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.Item1 = GetActivityDungeon1_PassReward_AllFrame_EUis(ui:GetChild("Item1"))
  uis.Item2 = GetActivityDungeon1_PassReward_AllFrame_EUis(ui:GetChild("Item2"))
  uis.root = ui
  return uis
end
