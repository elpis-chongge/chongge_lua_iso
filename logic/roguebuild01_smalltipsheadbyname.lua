require("RogueBuild01_SmallTipsHeadBgByName")

function GetRogueBuild01_SmallTipsHeadUis(ui)
  local uis = {}
  uis.HeadBg = GetRogueBuild01_SmallTipsHeadBgUis(ui:GetChild("HeadBg"))
  uis.root = ui
  return uis
end
