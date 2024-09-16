require("Shop_LeftTabByName")

function GetShop_RecommendUis(ui)
  local uis = {}
  uis.LeftTab = GetShop_LeftTabUis(ui:GetChild("LeftTab"))
  uis.TemplateList = ui:GetChild("TemplateList")
  uis.root = ui
  return uis
end
