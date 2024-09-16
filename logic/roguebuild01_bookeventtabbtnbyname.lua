require("RogueBuild01_BookEventTabBtnBgByName")
require("RogueBuild01_BookEventTabLockByName")

function GetRogueBuild01_BookEventTabBtnUis(ui)
  local uis = {}
  uis.Bg = GetRogueBuild01_BookEventTabBtnBgUis(ui:GetChild("Bg"))
  uis.Lock = GetRogueBuild01_BookEventTabLockUis(ui:GetChild("Lock"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
