function GetRogueBuild01_CoverDifficultyBtnUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
