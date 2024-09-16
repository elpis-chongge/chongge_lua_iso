require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("Arena_BattleNumber1ByName")

function GetArena_BattleNumber2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.BattleNumber1 = GetArena_BattleNumber1Uis(ui:GetChild("BattleNumber1"))
  uis.root = ui
  return uis
end
