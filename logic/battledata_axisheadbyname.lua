require("BattleData_StateTypeByName")

function GetBattleData_AxisHeadUis(ui)
  local uis = {}
  uis.HeadBtn = ui:GetChild("HeadBtn")
  uis.BuildHeadBtn = ui:GetChild("BuildHeadBtn")
  uis.GuildSkillBtn = ui:GetChild("GuildSkillBtn")
  uis.StateType = GetBattleData_StateTypeUis(ui:GetChild("StateType"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
