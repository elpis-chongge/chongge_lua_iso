require("PlayerInfo_BgAniByName")

function GetPlayerInfo_ShuiBtnUis(ui)
  local uis = {}
  uis.BgAni = GetPlayerInfo_BgAniUis(ui:GetChild("BgAni"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
