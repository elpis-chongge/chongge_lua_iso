require("Abyss_EventChoiceByName")

function GetAbyss_AllEventUis(ui)
  local uis = {}
  uis.EventChoice = GetAbyss_EventChoiceUis(ui:GetChild("EventChoice"))
  uis.PlayerBtn = ui:GetChild("PlayerBtn")
  uis.GuideboardBtn = ui:GetChild("GuideboardBtn")
  uis.ItemBtn = ui:GetChild("ItemBtn")
  uis.PlotBtn = ui:GetChild("PlotBtn")
  uis.BuildingBtn = ui:GetChild("BuildingBtn")
  uis.BossBattleBtn = ui:GetChild("BossBattleBtn")
  uis.ExpeditionBtn = ui:GetChild("ExpeditionBtn")
  uis.MovePlotBtn = ui:GetChild("MovePlotBtn")
  uis.eventCtr = ui:GetController("event")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
