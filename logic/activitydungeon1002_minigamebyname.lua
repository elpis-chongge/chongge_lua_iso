require("CommonResource_BackGroundByName")
require("ActivityDungeon1002_MiniMain_TopByName")
require("ActivityDungeon1002_MiniMain_BottonByName")

function GetActivityDungeon1002_MiniGameUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Top = GetActivityDungeon1002_MiniMain_TopUis(ui:GetChild("Top"))
  uis.Botton = GetActivityDungeon1002_MiniMain_BottonUis(ui:GetChild("Botton"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.StartBtn = ui:GetChild("StartBtn")
  uis.root = ui
  return uis
end
