require("DungeonInfo_EnergyLabelByName")

function GetDungeonInfo_BattleBtnRegionUis(ui)
  local uis = {}
  uis.Battle_B_Btn = ui:GetChild("Battle_B_Btn")
  uis.AiBattleBtn = ui:GetChild("AiBattleBtn")
  uis.Battle_S_Btn = ui:GetChild("Battle_S_Btn")
  uis.EnergyLabel = GetDungeonInfo_EnergyLabelUis(ui:GetChild("EnergyLabel"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
