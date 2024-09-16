require("CommonResource_PopupBgByName")
require("Formation_MonsterPicByName")

function GetFormation_MonsterTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.MonsterInfoList = ui:GetChild("MonsterInfoList")
  uis.MonsterPic = GetFormation_MonsterPicUis(ui:GetChild("MonsterPic"))
  uis.root = ui
  return uis
end
