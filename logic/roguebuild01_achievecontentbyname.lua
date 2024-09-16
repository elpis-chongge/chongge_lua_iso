function GetRogueBuild01_AchieveContentUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.LookBtn = ui:GetChild("LookBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.choiceCtr = ui:GetController("choice")
  uis.root = ui
  return uis
end
