require("RogueBuild01_TalentSpendNumberByName")

function GetRogueBuild01_TalentState1Uis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Spend = GetRogueBuild01_TalentSpendNumberUis(ui:GetChild("Spend"))
  uis.root = ui
  return uis
end
