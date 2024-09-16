require("Formation_MapIconPicByName")
require("Formation_UseTipsByName")
require("CommonResource_ArenaDefendNewByName")

function GetFormation_MapIconBtnUis(ui)
  local uis = {}
  uis.MapIconPic = GetFormation_MapIconPicUis(ui:GetChild("MapIconPic"))
  uis.UseTips = GetFormation_UseTipsUis(ui:GetChild("UseTips"))
  uis.New = GetCommonResource_ArenaDefendNewUis(ui:GetChild("New"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.lockCtr = ui:GetController("lock")
  uis.newCtr = ui:GetController("new")
  uis.root = ui
  return uis
end
