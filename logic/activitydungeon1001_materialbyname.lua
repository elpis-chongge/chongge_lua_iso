require("CommonResource_BackGroundByName")
require("ActivityDungeon1001_Material_BattleNumberByName")

function GetActivityDungeon1001_MaterialUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.BattleList = ui:GetChild("BattleList")
  uis.BattleNumber = GetActivityDungeon1001_Material_BattleNumberUis(ui:GetChild("BattleNumber"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
