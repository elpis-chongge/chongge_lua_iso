function GetSuperDungeon_PlayBossBuffUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.BuffList = ui:GetChild("BuffList")
  uis.root = ui
  return uis
end
