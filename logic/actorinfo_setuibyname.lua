function GetActorInfo_SetUIUis(ui)
  local uis = {}
  
  uis.SetTipsList = ui:GetChild("SetTipsList")
  uis.root = ui
  return uis
end
