require("TideDungeon_ExplainTitleByName")
require("TideDungeon_ExplainBuffRegionByName")

function GetTideDungeon_ExplainTipsUis(ui)
  local uis = {}
  uis.Title = GetTideDungeon_ExplainTitleUis(ui:GetChild("Title"))
  uis.Buff = GetTideDungeon_ExplainBuffRegionUis(ui:GetChild("Buff"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
