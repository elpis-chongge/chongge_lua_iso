require("RogueBuild01_BookSacredHeadBgByName")

function GetRogueBuild01_BookSacredHeadUis(ui)
  local uis = {}
  uis.HeadBg = GetRogueBuild01_BookSacredHeadBgUis(ui:GetChild("HeadBg"))
  uis.root = ui
  return uis
end
