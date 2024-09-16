function GetActorInfo_BattleInfoTipsUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.SetTipsList = ui:GetChild("SetTipsList")
  uis.root = ui
  return uis
end
