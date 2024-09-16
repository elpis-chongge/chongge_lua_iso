require("BattleData_GuildSkill_DataLabelBtnBgByName")

function GetBattleData_GuildSkill_DataLabelBtnUis(ui)
  local uis = {}
  uis.DataLabelBtnBg = GetBattleData_GuildSkill_DataLabelBtnBgUis(ui:GetChild("DataLabelBtnBg"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
