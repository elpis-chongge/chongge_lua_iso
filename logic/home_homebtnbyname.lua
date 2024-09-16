require("CommonResource_AbyssSignByName")
require("CommonResource_RedDotByName")

function GetHome_HomeBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.AbyssSign = GetCommonResource_AbyssSignUis(ui:GetChild("AbyssSign"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.abyssCtr = ui:GetController("abyss")
  uis.root = ui
  return uis
end
