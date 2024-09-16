require("BossDungeonWood_TimeByName")

function GetBossDungeonWood_Enter1BtnUis(ui)
  local uis = {}
  uis.Time = GetBossDungeonWood_TimeUis(ui:GetChild("Time"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.timeCtr = ui:GetController("time")
  uis.root = ui
  return uis
end
