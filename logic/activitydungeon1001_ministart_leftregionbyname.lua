require("ActivityDungeon1001_MiniStart_IntegralByName")

function GetActivityDungeon1001_MiniStart_LeftRegionUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1001_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.LeftMoveBtn = ui:GetChild("LeftMoveBtn")
  uis.RightMoveBtn = ui:GetChild("RightMoveBtn")
  uis.root = ui
  return uis
end
