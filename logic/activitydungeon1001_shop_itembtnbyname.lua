require("ActivityDungeon1001_Shop_CardHeadBgByName")
require("ActivityDungeon1001_Shop_ItemNumberByName")
require("ActivityDungeon1001_Shop_UseMarkByName")

function GetActivityDungeon1001_Shop_ItemBtnUis(ui)
  local uis = {}
  uis.CardHeadBg = GetActivityDungeon1001_Shop_CardHeadBgUis(ui:GetChild("CardHeadBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.ItemNumber = GetActivityDungeon1001_Shop_ItemNumberUis(ui:GetChild("ItemNumber"))
  uis.SpendLoader = ui:GetChild("SpendLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.UseMark = GetActivityDungeon1001_Shop_UseMarkUis(ui:GetChild("UseMark"))
  uis.StarList = ui:GetChild("StarList")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.c4Ctr = ui:GetController("c4")
  uis.c5Ctr = ui:GetController("c5")
  uis.root = ui
  return uis
end
