require("Abyss_ArrowByName")

function GetAbyss_TaskDirectionBtnUis(ui)
  local uis = {}
  uis.Arrow = GetAbyss_ArrowUis(ui:GetChild("Arrow"))
  uis.DistanceTxt = ui:GetChild("DistanceTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
