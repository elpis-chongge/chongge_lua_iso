require("CommonResource_PopupBgByName")
require("ActorInfo_BattleInfoTipsByName")

function GetActorInfo_BattleInfoUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.BattleInfoTips = GetActorInfo_BattleInfoTipsUis(ui:GetChild("BattleInfoTips"))
  uis.root = ui
  return uis
end
