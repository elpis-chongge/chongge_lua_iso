function GetBattle_BuffAddTag2Uis(ui)
  local uis = {}
  
  uis.StartList = ui:GetChild("StartList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.IntegralTxt = ui:GetChild("IntegralTxt")
  uis.IntegralProgressTxt = ui:GetChild("IntegralProgressTxt")
  uis.root = ui
  return uis
end
