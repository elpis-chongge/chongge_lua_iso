function GetBattle_BuffAddTag1Uis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.TimeProgressBar = ui:GetChild("TimeProgressBar")
  uis.TipsTxt = ui:GetChild("TipsTxt")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
