require("Chat_LeftWord1ByName")
require("Chat_RightWord1ByName")

function GetChat_ChatWordItem1Uis(ui)
  local uis = {}
  uis.LeftWord = GetChat_LeftWord1Uis(ui:GetChild("LeftWord"))
  uis.RightWord = GetChat_RightWord1Uis(ui:GetChild("RightWord"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
