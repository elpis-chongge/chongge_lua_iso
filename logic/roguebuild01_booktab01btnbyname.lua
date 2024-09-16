require("CommonResource_RedDotByName")

function GetRogueBuild01_BookTab01BtnUis(ui)
  local uis = {}
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.newCtr = ui:GetController("new")
  uis.root = ui
  return uis
end
