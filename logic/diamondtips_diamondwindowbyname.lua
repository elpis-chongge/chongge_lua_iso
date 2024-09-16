require("DiamondTips_DiamondByName")

function GetDiamondTips_DiamondWindowUis(ui)
  local uis = {}
  uis.Main = GetDiamondTips_DiamondUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
