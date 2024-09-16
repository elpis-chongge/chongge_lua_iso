require("Team_CardTipsByName")

function GetTeam_EditTipsBtnUis(ui)
  local uis = {}
  uis.CardTips = GetTeam_CardTipsUis(ui:GetChild("CardTips"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
