require("ItemGetShow_GetItemTips2ByName")

function GetItemGetShow_GetItemTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetItemGetShow_GetItemTips2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
