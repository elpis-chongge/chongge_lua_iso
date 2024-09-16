require("RogueBuild01_Camp_RebirthTipsByName")

function GetRogueBuild01_Camp_RebirthTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_Camp_RebirthTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
