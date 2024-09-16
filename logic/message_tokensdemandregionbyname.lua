require("Message_CardBreachByName")
require("Message_CardSkillByName")
require("Message_BadgeStarByName")
require("Message_DemandItemByName")

function GetMessage_TokensDemandRegionUis(ui)
  local uis = {}
  uis.CardBreach = GetMessage_CardBreachUis(ui:GetChild("CardBreach"))
  uis.CardSkill = GetMessage_CardSkillUis(ui:GetChild("CardSkill"))
  uis.BadgeStar = GetMessage_BadgeStarUis(ui:GetChild("BadgeStar"))
  uis.DemandItem = GetMessage_DemandItemUis(ui:GetChild("DemandItem"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
