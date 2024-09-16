function GetLotteryCardShow_CardTipsUis(ui)
  local uis = {}
  
  uis.StarList = ui:GetChild("StarList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.CardNameENTxt = ui:GetChild("CardNameENTxt")
  uis.ElementList = ui:GetChild("ElementList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
