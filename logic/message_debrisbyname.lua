require("CommonResource_BackGroundByName")
require("CommonResource_ItemFrameByName")

function GetMessage_DebrisUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Item1 = GetCommonResource_ItemFrameUis(ui:GetChild("Item1"))
  uis.Item2 = GetCommonResource_ItemFrameUis(ui:GetChild("Item2"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
