function GetPlotPlayEditor_CardBlinkUis(ui)
  local uis = {}
  
  uis.BlinkEditBtn = ui:GetChild("BlinkEditBtn")
  uis.BlinkTemplateList = ui:GetChild("BlinkTemplateList")
  uis.BlinkAddBtn = ui:GetChild("BlinkAddBtn")
  uis.BlinkDelBtn = ui:GetChild("BlinkDelBtn")
  uis.BlinkSaveBtn = ui:GetChild("BlinkSaveBtn")
  uis.BlinkJumpBtn = ui:GetChild("BlinkJumpBtn")
  uis.root = ui
  return uis
end
