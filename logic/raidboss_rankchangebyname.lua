require("CommonResource_PopupBgByName")
require("RaidBoss_RankChangeContentByName")

function GetRaidBoss_RankChangeUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.RankChangeContent = GetRaidBoss_RankChangeContentUis(ui:GetChild("RankChangeContent"))
  uis.root = ui
  return uis
end
