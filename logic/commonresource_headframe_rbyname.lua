require("CommonResource_PicMaskByName")
require("CommonResource_OccupationByName")
require("CommonResource_CardBreachByName")
require("CommonResource_HeadFrameStateByName")
require("CommonResource_HeadFrameWaveByName")

function GetCommonResource_HeadFrame_RUis(ui)
  local uis = {}
  uis.PicMask = GetCommonResource_PicMaskUis(ui:GetChild("PicMask"))
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.CardBreach = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach"))
  uis.StarList = ui:GetChild("StarList")
  uis.HpProgressBar = ui:GetChild("HpProgressBar")
  uis.State = GetCommonResource_HeadFrameStateUis(ui:GetChild("State"))
  uis.Wave = GetCommonResource_HeadFrameWaveUis(ui:GetChild("Wave"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.c4Ctr = ui:GetController("c4")
  uis.root = ui
  return uis
end
