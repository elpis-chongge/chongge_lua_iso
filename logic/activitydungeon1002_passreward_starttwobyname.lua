require("ActivityDungeon1002_PassReward_PicByName")

function GetActivityDungeon1002_PassReward_StartTwoUis(ui)
  local uis = {}
  uis.Pic = GetActivityDungeon1002_PassReward_PicUis(ui:GetChild("Pic"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.root = ui
  return uis
end
