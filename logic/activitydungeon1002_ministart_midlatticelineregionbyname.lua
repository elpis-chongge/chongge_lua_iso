require("ActivityDungeon1002_MiniStart_MidLatticeLineByName")

function GetActivityDungeon1002_MiniStart_MidLatticeLineRegionUis(ui)
  local uis = {}
  uis.Line1 = GetActivityDungeon1002_MiniStart_MidLatticeLineUis(ui:GetChild("Line1"))
  uis.Line2 = GetActivityDungeon1002_MiniStart_MidLatticeLineUis(ui:GetChild("Line2"))
  uis.Line3 = GetActivityDungeon1002_MiniStart_MidLatticeLineUis(ui:GetChild("Line3"))
  uis.Line4 = GetActivityDungeon1002_MiniStart_MidLatticeLineUis(ui:GetChild("Line4"))
  uis.Line5 = GetActivityDungeon1002_MiniStart_MidLatticeLineUis(ui:GetChild("Line5"))
  uis.Line6 = GetActivityDungeon1002_MiniStart_MidLatticeLineUis(ui:GetChild("Line6"))
  uis.Line1Ctr = ui:GetController("Line1")
  uis.Line2Ctr = ui:GetController("Line2")
  uis.Line3Ctr = ui:GetController("Line3")
  uis.Line4Ctr = ui:GetController("Line4")
  uis.Line5Ctr = ui:GetController("Line5")
  uis.Line6Ctr = ui:GetController("Line6")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
