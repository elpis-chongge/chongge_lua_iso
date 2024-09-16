function GetMessage_MapInfoUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.EfectTxt = ui:GetChild("EfectTxt")
  uis.Info1List = ui:GetChild("Info1List")
  uis.NoBuffTxt = ui:GetChild("NoBuffTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
