require("CommonResource_RedDotByName")

function GetTower_RewardBtnUis(ui)
  local uis = {}
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
