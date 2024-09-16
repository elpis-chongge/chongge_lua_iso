function GetLottery_ComplementItemUis(ui)
  local uis = {}
  
  uis.SpendTxt = ui:GetChild("SpendTxt")
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.root = ui
  return uis
end
