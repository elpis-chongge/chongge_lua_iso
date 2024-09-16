require("CommonResource_BackGroundByName")
require("ActivityDungeon1002_BossBattle_InfoByName")

function GetActivityDungeon1002_BossBattleUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.BattleList = ui:GetChild("BattleList")
  uis.Info = GetActivityDungeon1002_BossBattle_InfoUis(ui:GetChild("Info"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
