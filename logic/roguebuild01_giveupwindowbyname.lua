require("RogueBuild01_GiveUp2ByName")

function GetRogueBuild01_GiveUpWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_GiveUp2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
