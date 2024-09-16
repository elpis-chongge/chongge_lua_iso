require("CommonResource_RedDotByName")

function GetAbyss_ShopBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
