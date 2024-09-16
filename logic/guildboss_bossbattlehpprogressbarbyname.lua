require("GuildBoss_BossBattleHpProgressFillByName")

function GetGuildBoss_BossBattleHpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetGuildBoss_BossBattleHpProgressFillUis(ui:GetChild("bar"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
