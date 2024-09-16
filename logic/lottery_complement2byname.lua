require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("Lottery_Complement1ByName")

function GetLottery_Complement2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.Currency1 = GetLottery_Complement1Uis(ui:GetChild("Currency1"))
  uis.root = ui
  return uis
end
