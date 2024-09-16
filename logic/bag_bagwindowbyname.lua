require("Bag_BagByName")

function GetBag_BagWindowUis(ui)
  local uis = {}
  uis.Main = GetBag_BagUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
