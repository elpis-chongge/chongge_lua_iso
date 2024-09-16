require("CommonResource_PopupBgByName")
require("RogueBuild01_Camp_RecruitTipsRegionByName")

function GetRogueBuild01_Camp_RecruitTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TipsRegion = GetRogueBuild01_Camp_RecruitTipsRegionUis(ui:GetChild("TipsRegion"))
  uis.root = ui
  return uis
end
