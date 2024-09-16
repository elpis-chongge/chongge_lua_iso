require("BattleBuffTips_BuffTipsByName")

function GetBattleBuffTips_BuffTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetBattleBuffTips_BuffTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
