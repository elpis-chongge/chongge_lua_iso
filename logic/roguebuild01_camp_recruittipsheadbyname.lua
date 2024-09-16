require("RogueBuild01_Camp_RecruitTipsHeadBgByName")

function GetRogueBuild01_Camp_RecruitTipsHeadUis(ui)
  local uis = {}
  uis.Bg = GetRogueBuild01_Camp_RecruitTipsHeadBgUis(ui:GetChild("Bg"))
  uis.root = ui
  return uis
end
