require("RogueBuild01_DifficultyLook_TipsBgByName")
require("RogueBuild01_DifficultyLook_NumberByName")

function GetRogueBuild01_DifficultyLook_TipsUis(ui)
  local uis = {}
  uis.Bg = GetRogueBuild01_DifficultyLook_TipsBgUis(ui:GetChild("Bg"))
  uis.Number = GetRogueBuild01_DifficultyLook_NumberUis(ui:GetChild("Number"))
  uis.root = ui
  return uis
end
