require("Message_DemanHeadBgByName")
require("Message_DemanBadgeBgByName")

function GetMessage_DemanHeadUis(ui)
  local uis = {}
  uis.HeadBg = GetMessage_DemanHeadBgUis(ui:GetChild("HeadBg"))
  uis.BadgeBg = GetMessage_DemanBadgeBgUis(ui:GetChild("BadgeBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.headCtr = ui:GetController("head")
  uis.buttonCtr = ui:GetController("button")
  uis.c2Ctr = ui:GetController("c2")
  uis.badgeCtr = ui:GetController("badge")
  uis.root = ui
  return uis
end
