require("CommonResource_HeadByName")
require("Friend_OnLineByName")
require("Friend_LapseByName")

function GetFriend_FriendInfoUis(ui)
  local uis = {}
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.GuildTxt = ui:GetChild("GuildTxt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TaggingTxt = ui:GetChild("TaggingTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.OnLine = GetFriend_OnLineUis(ui:GetChild("OnLine"))
  uis.Lapse = GetFriend_LapseUis(ui:GetChild("Lapse"))
  uis.DelBtn = ui:GetChild("DelBtn")
  uis.RefuseBtn = ui:GetChild("RefuseBtn")
  uis.AddBtn = ui:GetChild("AddBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
