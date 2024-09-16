require("PlayerInfo_ChoiceHeadPicBgByName")
require("PlayerInfo_ChoiceHeadFramePicBgByName")
require("PlayerInfo_ChoiceHeadPicUseByName")

function GetPlayerInfo_ChoiceHeadPicUis(ui)
  local uis = {}
  uis.HeadBg = GetPlayerInfo_ChoiceHeadPicBgUis(ui:GetChild("HeadBg"))
  uis.FramePic = GetPlayerInfo_ChoiceHeadFramePicBgUis(ui:GetChild("FramePic"))
  uis.Use = GetPlayerInfo_ChoiceHeadPicUseUis(ui:GetChild("Use"))
  uis.c2Ctr = ui:GetController("c2")
  uis.c1Ctr = ui:GetController("c1")
  uis.typeCtr = ui:GetController("type")
  uis.root = ui
  return uis
end
