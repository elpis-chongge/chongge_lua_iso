function GetDungeonInfo_BossHpUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.BossHpProgressBar = ui:GetChild("BossHpProgressBar")
  uis.HpTxt = ui:GetChild("HpTxt")
  uis.root = ui
  return uis
end
