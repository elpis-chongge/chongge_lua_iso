require("CommonResource_RedDotByName")

function GetAbyss_ExpeditionLayerUis(ui)
  local uis = {}
  uis.Name3Txt = ui:GetChild("Name3Txt")
  uis.Name1Txt = ui:GetChild("Name1Txt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.root = ui
  return uis
end
