require("Shop_MonthTimeByName")

function GetShop_MonthBuyBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.PicHolder = ui:GetChild("PicHolder")
  uis.MonthTime = GetShop_MonthTimeUis(ui:GetChild("MonthTime"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
