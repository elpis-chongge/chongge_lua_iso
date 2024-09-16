require("CommonResource_RedDotByName")

function GetRogueBuild01_CoverTalentBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.newCtr = ui:GetController("new")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
