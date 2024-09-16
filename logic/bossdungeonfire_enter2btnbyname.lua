require("BossDungeonFire_TimeByName")

function GetBossDungeonFire_Enter2BtnUis(ui)
  local uis = {}
  uis.Time = GetBossDungeonFire_TimeUis(ui:GetChild("Time"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.timeCtr = ui:GetController("time")
  uis.root = ui
  return uis
end
