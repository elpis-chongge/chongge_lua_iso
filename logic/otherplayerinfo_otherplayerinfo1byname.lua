require("OtherPlayerInfo_CardShowAniByName")
require("OtherPlayerInfo_InfoByName")

function GetOtherPlayerInfo_OtherPlayerInfo1Uis(ui)
  local uis = {}
  uis.CardShowAni = GetOtherPlayerInfo_CardShowAniUis(ui:GetChild("CardShowAni"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.Info = GetOtherPlayerInfo_InfoUis(ui:GetChild("Info"))
  uis.root = ui
  return uis
end
