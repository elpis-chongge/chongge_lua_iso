require("OtherPlayerInfo_PopupBgByName")
require("OtherPlayerInfo_OtherPlayerInfo1ByName")

function GetOtherPlayerInfo_OtherPlayerInfo2Uis(ui)
  local uis = {}
  uis.PopupBg = GetOtherPlayerInfo_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.OtherPlayerInfo1 = GetOtherPlayerInfo_OtherPlayerInfo1Uis(ui:GetChild("OtherPlayerInfo1"))
  uis.root = ui
  return uis
end
