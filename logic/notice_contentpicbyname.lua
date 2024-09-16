function GetNotice_ContentPicUis(ui)
  local uis = {}
  
  uis.PicBigLoader = ui:GetChild("PicBigLoader")
  uis.PicBigHolder = ui:GetChild("PicBigHolder")
  uis.root = ui
  return uis
end
