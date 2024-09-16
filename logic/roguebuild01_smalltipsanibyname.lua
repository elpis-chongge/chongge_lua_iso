require("RogueBuild01_SmallTipsByName")

function GetRogueBuild01_SmallTipsAniUis(ui)
  local uis = {}
  uis.SmallTips = GetRogueBuild01_SmallTipsUis(ui:GetChild("SmallTips"))
  uis.root = ui
  return uis
end
