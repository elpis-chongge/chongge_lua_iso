require("Expedition_ReviewTips2_2BgByName")

function GetExpedition_ArrangeTips3_1Uis(ui)
  local uis = {}
  uis.HeadBg = GetExpedition_ReviewTips2_2BgUis(ui:GetChild("HeadBg"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
