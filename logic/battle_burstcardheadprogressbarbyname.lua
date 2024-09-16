require("Battle_BurstCardHeadBgByName")

function GetBattle_BurstCardHeadProgressBarUis(ui)
  local uis = {}
  uis.BurstCardHeadBg = GetBattle_BurstCardHeadBgUis(ui:GetChild("BurstCardHeadBg"))
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
