require("CommonResource_PopupBgByName")
require("PlayerInfo_ChoiceHeadTipsByName")

function GetPlayerInfo_ChoiceHeadUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.ChoiceHeadTips = GetPlayerInfo_ChoiceHeadTipsUis(ui:GetChild("ChoiceHeadTips"))
  uis.root = ui
  return uis
end
