require("RogueBuild01_DifficultyLook_ScoreAddByName")

function GetRogueBuild01_DifficultyLook_NumberUis(ui)
  local uis = {}
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ScoreAdd = GetRogueBuild01_DifficultyLook_ScoreAddUis(ui:GetChild("ScoreAdd"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
