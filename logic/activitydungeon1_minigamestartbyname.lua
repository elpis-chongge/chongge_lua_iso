require("CommonResource_BackGroundByName")
require("ActivityDungeon1_MiniStart_IntegralByName")
require("ActivityDungeon1_MiniStart_FlowerMapByName")
require("ActivityDungeon1_MiniStart_PauseTipsByName")

function GetActivityDungeon1_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.PauseBtn = ui:GetChild("PauseBtn")
  uis.Integral = GetActivityDungeon1_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.FlowerMap = GetActivityDungeon1_MiniStart_FlowerMapUis(ui:GetChild("FlowerMap"))
  uis.PauseTips = GetActivityDungeon1_MiniStart_PauseTipsUis(ui:GetChild("PauseTips"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
