function GetPlotPlayEditor_HeadUis(ui)
  local uis = {}
  
  uis.HeadHolder = ui:GetChild("HeadHolder")
  uis.ChooseHeadBtn = ui:GetChild("ChooseHeadBtn")
  uis.ActionList = ui:GetChild("ActionList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ReviewHeadTxt = ui:GetChild("ReviewHeadTxt")
  uis.ClearBtn = ui:GetChild("ClearBtn")
  uis.SaveBtn = ui:GetChild("SaveBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
