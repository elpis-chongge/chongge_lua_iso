require("CommonResource_PopupBgByName")
require("RaidBoss_QuickBattleContentByName")

function GetRaidBoss_QuickBattleUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.QuickBattleContent = GetRaidBoss_QuickBattleContentUis(ui:GetChild("QuickBattleContent"))
  uis.root = ui
  return uis
end
