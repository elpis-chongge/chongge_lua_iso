require("CommonResource_RedDotByName")

function GetRogueBuild01_ItemLook_Tab02BtnUis(ui)
  local uis = {}
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.newCtr = ui:GetController("new")
  uis.root = ui
  return uis
end
