require("CommonResource_RedDotByName")

function GetGuild_BossBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
