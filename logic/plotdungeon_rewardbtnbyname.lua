require("CommonResource_RedDotByName")

function GetPlotDungeon_RewardBtnUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
