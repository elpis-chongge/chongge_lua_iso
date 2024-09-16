require("RogueBuild01_CardUp_Info3UpNumberByName")

function GetRogueBuild01_CardUp_ReviveBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Spend = GetRogueBuild01_CardUp_Info3UpNumberUis(ui:GetChild("Spend"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
