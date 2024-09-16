require("RogueBuild01_Buy_SpendByName")

function GetRogueBuild01_Buy_SureBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Spend = GetRogueBuild01_Buy_SpendUis(ui:GetChild("Spend"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
