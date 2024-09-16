require("ItemGetShow_ItemListByName")

function GetItemGetShow_GetItemTips1Uis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.Item = GetItemGetShow_ItemListUis(ui:GetChild("Item"))
  uis.TitleEffectHolder = ui:GetChild("TitleEffectHolder")
  uis.root = ui
  return uis
end
