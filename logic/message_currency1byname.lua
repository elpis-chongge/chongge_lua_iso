function GetMessage_Currency1Uis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
