require("Watch_CardHeadPicByName")

function GetWatch_CardHeadBtnUis(ui)
  local uis = {}
  uis.CardHeadPic = GetWatch_CardHeadPicUis(ui:GetChild("CardHeadPic"))
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
