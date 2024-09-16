require("BattleBuffTips_CardShowByName")
require("BattleBuffTips_MonterShowByName")
require("BattleBuffTips_BuffCountByName")

function GetBattleBuffTips_BuffTipsUis(ui)
  local uis = {}
  uis.CardShow = GetBattleBuffTips_CardShowUis(ui:GetChild("CardShow"))
  uis.MonterShow = GetBattleBuffTips_MonterShowUis(ui:GetChild("MonterShow"))
  uis.BuffCount = GetBattleBuffTips_BuffCountUis(ui:GetChild("BuffCount"))
  uis.HeadList = ui:GetChild("HeadList")
  uis.BuffList = ui:GetChild("BuffList")
  uis.SwitchBtn = ui:GetChild("SwitchBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
