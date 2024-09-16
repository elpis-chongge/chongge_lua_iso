function GetAbyss_MoveEventTipsUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ModuleList = ui:GetChild("ModuleList")
  uis.NextStepBtn = ui:GetChild("NextStepBtn")
  uis.ChoiceList = ui:GetChild("ChoiceList")
  uis.EndChoiceBtn = ui:GetChild("EndChoiceBtn")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
