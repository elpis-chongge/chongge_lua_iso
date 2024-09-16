require("CommonResource_PopupBgByName")
require("Formation_BuildLockByName")

function GetFormation_BuildTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ElementList = ui:GetChild("ElementList")
  uis.ModuleList = ui:GetChild("ModuleList")
  uis.WordList = ui:GetChild("WordList")
  uis.BuildLock = GetFormation_BuildLockUis(ui:GetChild("BuildLock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
