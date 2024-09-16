require("Shop_TabBtnBgByName")
require("CommonResource_RedDotByName")

function GetShop_TabBtnUis(ui)
  local uis = {}
  uis.TabBtnBg = GetShop_TabBtnBgUis(ui:GetChild("TabBtnBg"))
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
