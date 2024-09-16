require("Expedition_ReviewTips2_1ByName")

function GetExpedition_ReviewTips2_4Uis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.Wave = GetExpedition_ReviewTips2_1Uis(ui:GetChild("Wave"))
  uis.HeadList = ui:GetChild("HeadList")
  uis.SwitchBtn = ui:GetChild("SwitchBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
