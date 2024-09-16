require("PlayerInfo_TitleByName")
require("PlayerInfo_PlotByName")
require("PlayerInfo_OtherMaterialByName")

function GetPlayerInfo_RightUis(ui)
  local uis = {}
  uis.Title1 = GetPlayerInfo_TitleUis(ui:GetChild("Title1"))
  uis.Plot = GetPlayerInfo_PlotUis(ui:GetChild("Plot"))
  uis.BattleBtn = ui:GetChild("BattleBtn")
  uis.Title2 = GetPlayerInfo_TitleUis(ui:GetChild("Title2"))
  uis.MaterialList = ui:GetChild("MaterialList")
  uis.OtherMaterial = GetPlayerInfo_OtherMaterialUis(ui:GetChild("OtherMaterial"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
