require("CommonResource_PopupBgByName")

function GetExplore_SettlementUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.EndList = ui:GetChild("EndList")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.root = ui
  return uis
end
