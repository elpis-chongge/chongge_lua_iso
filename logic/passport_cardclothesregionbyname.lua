require("Passport_ClothesTipsByName")
require("Passport_CardQBByName")
require("Passport_Clothes_Grade1ByName")
require("Passport_Clothes_Grade2ByName")

function GetPassport_CardClothesRegionUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.ClothesTips = GetPassport_ClothesTipsUis(ui:GetChild("ClothesTips"))
  uis.CardQB = GetPassport_CardQBUis(ui:GetChild("CardQB"))
  uis.CardLookBtn = ui:GetChild("CardLookBtn")
  uis.Grade1 = GetPassport_Clothes_Grade1Uis(ui:GetChild("Grade1"))
  uis.Grade2 = GetPassport_Clothes_Grade2Uis(ui:GetChild("Grade2"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
