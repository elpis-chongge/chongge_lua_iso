require("Expedition_ReviewTabAniByName")

function GetExpedition_ReviewTabBtnUis(ui)
  local uis = {}
  uis.ReviewTabAni = GetExpedition_ReviewTabAniUis(ui:GetChild("ReviewTabAni"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
