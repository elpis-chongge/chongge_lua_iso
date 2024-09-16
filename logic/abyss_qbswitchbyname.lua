function GetAbyss_QBSwitchUis(ui)
  local uis = {}
  
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.HeadList = ui:GetChild("HeadList")
  uis.root = ui
  return uis
end
