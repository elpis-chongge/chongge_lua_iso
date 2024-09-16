require("RogueBuild01_Camp_RecoveryTipsHeadBgByName")

function GetRogueBuild01_Camp_RecoveryTipsHeadUis(ui)
  local uis = {}
  uis.HeadBg = GetRogueBuild01_Camp_RecoveryTipsHeadBgUis(ui:GetChild("HeadBg"))
  uis.HpProgressBar = ui:GetChild("HpProgressBar")
  uis.root = ui
  return uis
end
