require("Message_TokensBuyNumberByName")
require("Message_LackWordByName")

function GetMessage_TokensBuyUis(ui)
  local uis = {}
  uis.AllPrice = GetMessage_TokensBuyNumberUis(ui:GetChild("AllPrice"))
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.LackWord = GetMessage_LackWordUis(ui:GetChild("LackWord"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
