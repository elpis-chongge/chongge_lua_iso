require("RogueBuild01_Camp_RecruitTipsByName")

function GetRogueBuild01_Camp_RecruitTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_Camp_RecruitTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
