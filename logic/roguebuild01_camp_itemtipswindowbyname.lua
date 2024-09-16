require("RogueBuild01_Camp_ItemTipsByName")

function GetRogueBuild01_Camp_ItemTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_Camp_ItemTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
