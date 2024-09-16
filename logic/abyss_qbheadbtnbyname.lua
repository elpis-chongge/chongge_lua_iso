require("Abyss_CardHeadPicByName")

function GetAbyss_QBHeadBtnUis(ui)
  local uis = {}
  uis.CardHeadPic = GetAbyss_CardHeadPicUis(ui:GetChild("CardHeadPic"))
  uis.CardNameTxt = ui:GetChild("CardNameTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
