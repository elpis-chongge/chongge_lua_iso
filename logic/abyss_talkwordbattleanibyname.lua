require("Abyss_TalkWordBattleByName")

function GetAbyss_TalkWordBattleAniUis(ui)
  local uis = {}
  uis.TalkWordBattle = GetAbyss_TalkWordBattleUis(ui:GetChild("TalkWordBattle"))
  uis.root = ui
  return uis
end
