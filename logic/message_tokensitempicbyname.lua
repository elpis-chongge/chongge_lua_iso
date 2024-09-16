require("Message_TokensPic1ByName")
require("Message_TokensPic2ByName")

function GetMessage_TokensItemPicUis(ui)
  local uis = {}
  uis.Pic1 = GetMessage_TokensPic1Uis(ui:GetChild("Pic1"))
  uis.Pic2 = GetMessage_TokensPic2Uis(ui:GetChild("Pic2"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
