require("Lottery_P_B_CardHeadBgByName")
require("CommonResource_OccupationByName")

function GetLottery_P_B_CardHeadBtnUis(ui)
  local uis = {}
  uis.CardPic = GetLottery_P_B_CardHeadBgUis(ui:GetChild("CardPic"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
