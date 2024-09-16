require("Friend_ListTabBgByName")
require("CommonResource_RedDotByName")

function GetFriend_ListTabBtnUis(ui)
  local uis = {}
  uis.ListTabBg = GetFriend_ListTabBgUis(ui:GetChild("ListTabBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
