function GetFormation_BurstTips2Uis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.ContentList = ui:GetChild("ContentList")
  uis.root = ui
  return uis
end
