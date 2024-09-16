require("RaidBoss_QuickBattleNumberRegionByName")

function GetRaidBoss_QuickBattleContentUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberRegion = GetRaidBoss_QuickBattleNumberRegionUis(ui:GetChild("NumberRegion"))
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.root = ui
  return uis
end
