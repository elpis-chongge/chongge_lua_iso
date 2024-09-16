require("Expedition_CoverProgressByName")

function GetExpedition_CoverStartBtnUis(ui)
  local uis = {}
  uis.CoverProgress = GetExpedition_CoverProgressUis(ui:GetChild("CoverProgress"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
