require("PlayerInfo_CardHeadPicByName")

function GetPlayerInfo_CardHeadUis(ui)
  local uis = {}
  uis.CardHeadPic = GetPlayerInfo_CardHeadPicUis(ui:GetChild("CardHeadPic"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
