require("Message_CardHeadBgByName")
require("CommonResource_OccupationByName")

function GetMessage_CardHeadBtnUis(ui)
  local uis = {}
  uis.CardPic = GetMessage_CardHeadBgUis(ui:GetChild("CardPic"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.StarList = ui:GetChild("StarList")
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
