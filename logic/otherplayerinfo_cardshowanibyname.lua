require("OtherPlayerInfo_CardShowByName")

function GetOtherPlayerInfo_CardShowAniUis(ui)
  local uis = {}
  uis.CardShow = GetOtherPlayerInfo_CardShowUis(ui:GetChild("CardShow"))
  uis.root = ui
  return uis
end
