function GetGuildBoss_GuildBossTitleUis(ui)
  local uis = {}
  
  uis.GulidIconLoader = ui:GetChild("GulidIconLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
