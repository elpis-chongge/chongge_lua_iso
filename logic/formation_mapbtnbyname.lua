require("Formation_MapPicByName")
require("CommonResource_ArenaDefendNewByName")

function GetFormation_MapBtnUis(ui)
  local uis = {}
  uis.MapPic = GetFormation_MapPicUis(ui:GetChild("MapPic"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.New = GetCommonResource_ArenaDefendNewUis(ui:GetChild("New"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.newCtr = ui:GetController("new")
  uis.root = ui
  return uis
end
