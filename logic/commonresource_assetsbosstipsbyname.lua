function GetCommonResource_AssetsBossTipsUis(ui)
  local uis = {}
  
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.AssetsBtn = ui:GetChild("AssetsBtn")
  uis.root = ui
  return uis
end
