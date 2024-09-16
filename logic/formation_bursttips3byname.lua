require("Formation_SetRoundRegionByName")

function GetFormation_BurstTips3Uis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.HeadList = ui:GetChild("HeadList")
  uis.SetRoundRegion = GetFormation_SetRoundRegionUis(ui:GetChild("SetRoundRegion"))
  uis.root = ui
  return uis
end
