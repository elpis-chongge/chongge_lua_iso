function GetMessage_SweepResultListUis(ui)
  local uis = {}
  
  uis.ResultList = ui:GetChild("ResultList")
  uis.root = ui
  return uis
end
