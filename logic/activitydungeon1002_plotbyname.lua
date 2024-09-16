require("CommonResource_BackGroundByName")
require("ActivityDungeon1002_Plot_WordByName")

function GetActivityDungeon1002_PlotUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Word = GetActivityDungeon1002_Plot_WordUis(ui:GetChild("Word"))
  uis.PlotList = ui:GetChild("PlotList")
  uis.ProspectBtn = ui:GetChild("ProspectBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
