require("CommonResource_BuildPicByName")
require("CommonResource_HeadFrameStateByName")
require("CommonResource_ArenaDefendNewByName")

function GetCommonResource_BuildFrame_RUis(ui)
  local uis = {}
  uis.BuildPic = GetCommonResource_BuildPicUis(ui:GetChild("BuildPic"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.State = GetCommonResource_HeadFrameStateUis(ui:GetChild("State"))
  uis.BuildTxt = ui:GetChild("BuildTxt")
  uis.SizeTxt = ui:GetChild("SizeTxt")
  uis.LockTxt = ui:GetChild("LockTxt")
  uis.New = GetCommonResource_ArenaDefendNewUis(ui:GetChild("New"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.newCtr = ui:GetController("new")
  uis.root = ui
  return uis
end
