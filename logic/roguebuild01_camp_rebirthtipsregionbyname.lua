require("RogueBuild01_Camp_RecruitTipsHeadByName")

function GetRogueBuild01_Camp_RebirthTipsRegionUis(ui)
  local uis = {}
  uis.Head = GetRogueBuild01_Camp_RecruitTipsHeadUis(ui:GetChild("Head"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.HpProgressBar = ui:GetChild("HpProgressBar")
  uis.root = ui
  return uis
end
