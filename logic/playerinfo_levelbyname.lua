function GetPlayerInfo_LevelUis(ui)
  local uis = {}
  
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.CopyBtn = ui:GetChild("CopyBtn")
  uis.root = ui
  return uis
end
