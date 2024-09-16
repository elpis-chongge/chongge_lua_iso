require("BattleBuffTips_CardHeadByName")
require("BattleBuffTips_MonsterHeadByName")

function GetBattleBuffTips_HeadBtnUis(ui)
  local uis = {}
  uis.CardHead = GetBattleBuffTips_CardHeadUis(ui:GetChild("CardHead"))
  uis.MonsterHead = GetBattleBuffTips_MonsterHeadUis(ui:GetChild("MonsterHead"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
