require("CommonResource_PopupBgByName")
require("RogueBuild01_Sacred_TipsByName")

function GetRogueBuild01_InsideSacredUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.Tips = GetRogueBuild01_Sacred_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
