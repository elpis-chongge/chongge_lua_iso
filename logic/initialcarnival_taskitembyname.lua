function GetInitialCarnival_TaskItemUis(ui)
  local uis = {}
  
  uis.ItemEffectHolder = ui:GetChild("ItemEffectHolder")
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ProgressTxt = ui:GetChild("ProgressTxt")
  uis.SubmitTxt = ui:GetChild("SubmitTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
