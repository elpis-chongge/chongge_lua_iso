require("Chat_TargetBtnBgByName")
require("Chat_OnLineByName")
require("CommonResource_ChatByName")

function GetChat_TargetBtnUis(ui)
  local uis = {}
  uis.PlayerHeadBg = GetChat_TargetBtnBgUis(ui:GetChild("PlayerHeadBg"))
  uis.OnLine = GetChat_OnLineUis(ui:GetChild("OnLine"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Red = GetCommonResource_ChatUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
