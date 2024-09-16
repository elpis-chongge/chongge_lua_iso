require("CommonResource_PopupBgByName")
require("ActorInfo_AccountTipsByName")

function GetActorInfo_AccountTipsWindowUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.AccountTips = GetActorInfo_AccountTipsUis(ui:GetChild("AccountTips"))
  uis.root = ui
  return uis
end
