function GetInitialSign_ShowItemTipsUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.DayTxt = ui:GetChild("DayTxt")
  uis.Day1Txt = ui:GetChild("Day1Txt")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.ItemList = ui:GetChild("ItemList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
