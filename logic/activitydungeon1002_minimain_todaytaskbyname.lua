require("ActivityDungeon1002_PassReward_AllFrame_EByName")
require("CommonResource_RedDotByName")

function GetActivityDungeon1002_MiniMain_TodayTaskUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1002_PassReward_AllFrame_EUis(ui:GetChild("Item"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
