require("RogueBuild01_LetterTipsByName")

function GetRogueBuild01_LetterTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetRogueBuild01_LetterTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
