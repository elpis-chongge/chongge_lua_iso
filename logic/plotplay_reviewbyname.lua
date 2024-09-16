function GetPlotPlay_ReviewUis(ui)
  local uis = {}
  
  uis.ReviewTalkList = ui:GetChild("ReviewTalkList")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
