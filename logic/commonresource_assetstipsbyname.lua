function GetCommonResource_AssetsTipsUis(ui)
  local uis = {}
  
  uis.IconLoader = ui:GetChild("IconLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.AssetsBtn = ui:GetChild("AssetsBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
