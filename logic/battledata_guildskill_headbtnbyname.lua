require("BattleData_GuildSkill_HeadBgByName")

function GetBattleData_GuildSkill_HeadBtnUis(ui)
  local uis = {}
  uis.Head = GetBattleData_GuildSkill_HeadBgUis(ui:GetChild("Head"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
