require("CommonResource_PopupBgByName")

function GetInitialSign_InitialSignAutoUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.BgLoader = ui:GetChild("BgLoader")
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
