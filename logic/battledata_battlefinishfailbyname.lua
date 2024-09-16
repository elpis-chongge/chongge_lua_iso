require("CommonResource_BackGroundByName")
require("BattleData_FailTitleWordByName")

function GetBattleData_BattleFinishFailUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TitleWord = GetBattleData_FailTitleWordUis(ui:GetChild("TitleWord"))
  uis.WordList = ui:GetChild("WordList")
  uis.FailAgainBtn = ui:GetChild("FailAgainBtn")
  uis.FailOutBtn = ui:GetChild("FailOutBtn")
  uis.TimeBtn = ui:GetChild("TimeBtn")
  uis.DataBtn = ui:GetChild("DataBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
