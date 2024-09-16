require("Chat_LeftWordByName")
require("Chat_RightWordByName")

function GetChat_ChatWordItemUis(ui)
  local uis = {}
  uis.LeftWord = GetChat_LeftWordUis(ui:GetChild("LeftWord"))
  uis.RightWord = GetChat_RightWordUis(ui:GetChild("RightWord"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
