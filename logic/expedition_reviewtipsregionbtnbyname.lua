require("Expedition_ReviewTips1ByName")

function GetExpedition_ReviewTipsRegionBtnUis(ui)
  local uis = {}
  uis.TipsList = ui:GetChild("TipsList")
  uis.ReviewTips1 = GetExpedition_ReviewTips1Uis(ui:GetChild("ReviewTips1"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
