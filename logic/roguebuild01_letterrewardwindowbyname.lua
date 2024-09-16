require("RogueBuild01_LetterRewardByName")

function GetRogueBuild01_LetterRewardWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_LetterRewardUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
