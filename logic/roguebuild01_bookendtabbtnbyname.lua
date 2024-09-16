require("RogueBuild01_BookEndTabLockByName")

function GetRogueBuild01_BookEndTabBtnUis(ui)
  local uis = {}
  uis.Lock = GetRogueBuild01_BookEndTabLockUis(ui:GetChild("Lock"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
