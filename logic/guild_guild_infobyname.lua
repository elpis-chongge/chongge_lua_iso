function GetGuild_Guild_infoUis(ui)
  local uis = {}
  
  uis.GulidIconLoader = ui:GetChild("GulidIconLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.RenameBtn = ui:GetChild("RenameBtn")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.ExpTxt = ui:GetChild("ExpTxt")
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.StageTxt = ui:GetChild("StageTxt")
  uis.root = ui
  return uis
end
