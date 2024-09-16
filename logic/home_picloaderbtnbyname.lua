function GetHome_PicLoaderBtnUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
