require("TideDungeon_TabBgByName")

function GetTideDungeon_TabBtnUis(ui)
  local uis = {}
  uis.TabBg = GetTideDungeon_TabBgUis(ui:GetChild("TabBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.LockTxt = ui:GetChild("LockTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
