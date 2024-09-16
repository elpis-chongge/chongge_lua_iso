require("CommonResource_PopupBgByName")
require("ExploreSign_EndBgByName")

function GetExploreSign_EndUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.EndBg = GetExploreSign_EndBgUis(ui:GetChild("EndBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.root = ui
  return uis
end
