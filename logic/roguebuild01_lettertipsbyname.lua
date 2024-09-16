require("CommonResource_PopupBgByName")
require("RogueBuild01_LetterRegionByName")

function GetRogueBuild01_LetterTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.LetterRegion = GetRogueBuild01_LetterRegionUis(ui:GetChild("LetterRegion"))
  uis.root = ui
  return uis
end
