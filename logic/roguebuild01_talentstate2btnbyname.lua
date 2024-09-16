require("RogueBuild01_TalentSpendNumberByName")

function GetRogueBuild01_TalentState2BtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Spend = GetRogueBuild01_TalentSpendNumberUis(ui:GetChild("Spend"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
