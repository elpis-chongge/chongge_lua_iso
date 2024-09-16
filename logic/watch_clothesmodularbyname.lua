require("Watch_ClothesTipsByName")

function GetWatch_ClothesModularUis(ui)
  local uis = {}
  uis.PicList = ui:GetChild("PicList")
  uis.UseBtn = ui:GetChild("UseBtn")
  uis.ClothesTips = GetWatch_ClothesTipsUis(ui:GetChild("ClothesTips"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
