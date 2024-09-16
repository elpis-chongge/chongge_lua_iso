require("Message_TokensTipsMainByName")
require("Message_TokensCardByName")

function GetMessage_TokensTipsUis(ui)
  local uis = {}
  uis.TokensTipsMain = GetMessage_TokensTipsMainUis(ui:GetChild("TokensTipsMain"))
  uis.TokensCard = GetMessage_TokensCardUis(ui:GetChild("TokensCard"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
