require("Badge_OccupationByName")
require("Badge_HeadFrameBgByName")
require("Badge_CardBreachByName")
require("Badge_Mark1ByName")
require("Badge_Mark2ByName")
require("Badge_Mark3ByName")
require("CommonResource_RedDotByName")

function GetBadge_HeadFrameUis(ui)
  local uis = {}
  uis.Occupation = GetBadge_OccupationUis(ui:GetChild("Occupation"))
  uis.HeadFrameBg = GetBadge_HeadFrameBgUis(ui:GetChild("HeadFrameBg"))
  uis.CardBreach = GetBadge_CardBreachUis(ui:GetChild("CardBreach"))
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.Mark1 = GetBadge_Mark1Uis(ui:GetChild("Mark1"))
  uis.Mark2 = GetBadge_Mark2Uis(ui:GetChild("Mark2"))
  uis.Mark3 = GetBadge_Mark3Uis(ui:GetChild("Mark3"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
