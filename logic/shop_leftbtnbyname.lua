require("CommonResource_RedDotByName")
require("Shop_NewByName")

function GetShop_LeftBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.New = GetShop_NewUis(ui:GetChild("New"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
