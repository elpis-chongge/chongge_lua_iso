require("PlayerInfo_CardTipsByName")

function GetPlayerInfo_ChoiceTipsBtnUis(ui)
  local uis = {}
  uis.CardTips = GetPlayerInfo_CardTipsUis(ui:GetChild("CardTips"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
