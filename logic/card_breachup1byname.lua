require("CommonResource_CardBreachByName")

function GetCard_BreachUp1Uis(ui)
  local uis = {}
  uis.CardBreach1 = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach1"))
  uis.CardBreach2 = GetCommonResource_CardBreachUis(ui:GetChild("CardBreach2"))
  uis.BreachSkillList = ui:GetChild("BreachSkillList")
  uis.BreachLookBtn = ui:GetChild("BreachLookBtn")
  uis.root = ui
  return uis
end
