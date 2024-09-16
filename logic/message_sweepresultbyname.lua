function GetMessage_SweepResultUis(ui)
  local uis = {}
  
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
