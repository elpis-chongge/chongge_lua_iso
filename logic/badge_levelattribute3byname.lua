require("Badge_NewByName")

function GetBadge_LevelAttribute3Uis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.Number1Txt = ui:GetChild("Number1Txt")
  uis.Number2Txt = ui:GetChild("Number2Txt")
  uis.New = GetBadge_NewUis(ui:GetChild("New"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
