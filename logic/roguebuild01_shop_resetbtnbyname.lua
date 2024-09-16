require("RogueBuild01_Shop_ResetNumberByName")

function GetRogueBuild01_Shop_ResetBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Spend = GetRogueBuild01_Shop_ResetNumberUis(ui:GetChild("Spend"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
