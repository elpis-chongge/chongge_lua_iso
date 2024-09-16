require("CommonResource_PopupBgByName")
require("RaidBoss_ActionRecordTitleByName")
require("RaidBoss_ActionRecordNowRankByName")
require("RaidBoss_ActionRecordTipsListByName")

function GetRaidBoss_ActionRecordUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.ActionRecordTitle = GetRaidBoss_ActionRecordTitleUis(ui:GetChild("ActionRecordTitle"))
  uis.NowRank = GetRaidBoss_ActionRecordNowRankUis(ui:GetChild("NowRank"))
  uis.ActionRecordTipsList = GetRaidBoss_ActionRecordTipsListUis(ui:GetChild("ActionRecordTipsList"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
