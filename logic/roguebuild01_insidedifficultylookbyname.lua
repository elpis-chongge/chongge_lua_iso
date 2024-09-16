require("CommonResource_PopupBgByName")
require("RogueBuild01_DifficultyLook_TipsByName")

function GetRogueBuild01_InsideDifficultyLookUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetRogueBuild01_DifficultyLook_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
