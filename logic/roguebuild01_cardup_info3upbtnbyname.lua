require("RogueBuild01_CardUp_Info3UpNumberByName")

function GetRogueBuild01_CardUp_Info3UpBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Spend = GetRogueBuild01_CardUp_Info3UpNumberUis(ui:GetChild("Spend"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
