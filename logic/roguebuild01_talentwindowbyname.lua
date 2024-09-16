require("RogueBuild01_TalentByName")

function GetRogueBuild01_TalentWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_TalentUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
