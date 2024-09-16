require("RogueBuild01_DifficultyScoreAddByName")

function GetRogueBuild01_DifficultyTipsUis(ui)
  local uis = {}
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ScoreAdd = GetRogueBuild01_DifficultyScoreAddUis(ui:GetChild("ScoreAdd"))
  uis.EffectList = ui:GetChild("EffectList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
