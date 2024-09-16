require("Message_TokensPrice1_1ByName")
require("Message_TokensPrice1_2ByName")

function GetMessage_TokensPrice1Uis(ui)
  local uis = {}
  uis.Price1 = GetMessage_TokensPrice1_1Uis(ui:GetChild("Price1"))
  uis.Price2 = GetMessage_TokensPrice1_2Uis(ui:GetChild("Price2"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
