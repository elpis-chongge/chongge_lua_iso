require("ActivityDungeon1002_MiniStart_MidLatticeLineRegionByName")

function GetActivityDungeon1002_MiniStart_MidLatticeUis(ui)
  local uis = {}
  uis.Line = GetActivityDungeon1002_MiniStart_MidLatticeLineRegionUis(ui:GetChild("Line"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
