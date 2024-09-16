require("DungeonInfo_ItemLabelByName")

function GetDungeonInfo_ItemFrameUis(ui)
  local uis = {}
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemLabel = GetDungeonInfo_ItemLabelUis(ui:GetChild("ItemLabel"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
