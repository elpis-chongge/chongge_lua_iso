function GetPlayerInfo_CardNumberUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.CardNumberTxt = ui:GetChild("CardNumberTxt")
  uis.HeadList = ui:GetChild("HeadList")
  uis.root = ui
  return uis
end
