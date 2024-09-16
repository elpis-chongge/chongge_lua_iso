require("RaidBoss_QuickBattleByName")

function GetRaidBoss_QuickBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetRaidBoss_QuickBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
