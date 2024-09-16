require("Shop_MonthExplain2ByName")

function GetShop_MonthExplainWindowUis(ui)
  local uis = {}
  uis.Main = GetShop_MonthExplain2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
