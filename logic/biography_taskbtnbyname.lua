require("Biography_CompleteTipsByName")
require("CommonResource_ItemFrameByName")
require("CommonResource_RedDotByName")

function GetBiography_TaskBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NameNumberTxt = ui:GetChild("NameNumberTxt")
  uis.CompleteTips = GetBiography_CompleteTipsUis(ui:GetChild("CompleteTips"))
  uis.Item = GetCommonResource_ItemFrameUis(ui:GetChild("Item"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.GoToBtn = ui:GetChild("GoToBtn")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
