require("Card_ClothesPicByName")

function GetCard_ClothesPicBtnUis(ui)
  local uis = {}
  uis.ClothesPic = GetCard_ClothesPicUis(ui:GetChild("ClothesPic"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.LineImage = ui:GetChild("LineImage")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
