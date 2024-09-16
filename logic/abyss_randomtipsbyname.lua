function GetAbyss_RandomTipsUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TalkList = ui:GetChild("TalkList")
  uis.ChoiceList = ui:GetChild("ChoiceList")
  uis.EndChoiceBtn = ui:GetChild("EndChoiceBtn")
  uis.NextStepBtn = ui:GetChild("NextStepBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
