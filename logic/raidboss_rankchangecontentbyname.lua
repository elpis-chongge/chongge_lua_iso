require("RaidBoss_RankChangeNumberByName")
require("RaidBoss_RankChangeRecordByName")

function GetRaidBoss_RankChangeContentUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.ChangeNumber = GetRaidBoss_RankChangeNumberUis(ui:GetChild("ChangeNumber"))
  uis.ChangeRecord = GetRaidBoss_RankChangeRecordUis(ui:GetChild("ChangeRecord"))
  uis.root = ui
  return uis
end
