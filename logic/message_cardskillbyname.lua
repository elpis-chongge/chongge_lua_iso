function GetMessage_CardSkillUis(ui)
  local uis = {}
  
  uis.Pic1Loader = ui:GetChild("Pic1Loader")
  uis.Pic2Loader = ui:GetChild("Pic2Loader")
  uis.Level1Txt = ui:GetChild("Level1Txt")
  uis.Level2Txt = ui:GetChild("Level2Txt")
  uis.root = ui
  return uis
end
