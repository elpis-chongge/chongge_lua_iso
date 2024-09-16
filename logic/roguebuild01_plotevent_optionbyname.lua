function GetRogueBuild01_PlotEvent_OptionUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.LookBtn = ui:GetChild("LookBtn")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ChoiceBtn = ui:GetChild("ChoiceBtn")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.choiceCtr = ui:GetController("choice")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
