require("Badge_DecomposeTabRegionByName")
require("Badge_ChoiceSortByName")
require("Badge_DecomposeResultByName")

function GetBadge_DecomposeListUis(ui)
  local uis = {}
  uis.DecomposeTabRegion = GetBadge_DecomposeTabRegionUis(ui:GetChild("DecomposeTabRegion"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.ChoiceNumberTxt = ui:GetChild("ChoiceNumberTxt")
  uis.ChoiceBtn = ui:GetChild("ChoiceBtn")
  uis.ChoiceSort = GetBadge_ChoiceSortUis(ui:GetChild("ChoiceSort"))
  uis.AllChoiceBtn = ui:GetChild("AllChoiceBtn")
  uis.DecomposeSrueBtn = ui:GetChild("DecomposeSrueBtn")
  uis.DecomposeResult = GetBadge_DecomposeResultUis(ui:GetChild("DecomposeResult"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
