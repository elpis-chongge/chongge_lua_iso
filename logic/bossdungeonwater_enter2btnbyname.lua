require("BossDungeonWater_TimeByName")

function GetBossDungeonWater_Enter2BtnUis(ui)
  local uis = {}
  uis.Time = GetBossDungeonWater_TimeUis(ui:GetChild("Time"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.timeCtr = ui:GetController("time")
  uis.root = ui
  return uis
end
