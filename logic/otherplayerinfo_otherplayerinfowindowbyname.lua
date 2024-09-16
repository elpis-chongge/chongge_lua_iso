require("OtherPlayerInfo_OtherPlayerInfo2ByName")

function GetOtherPlayerInfo_OtherPlayerInfoWindowUis(ui)
  local uis = {}
  uis.Main = GetOtherPlayerInfo_OtherPlayerInfo2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
