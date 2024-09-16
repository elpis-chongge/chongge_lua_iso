require("Chat_LineTabByName")

function GetChat_ChoiceLine1Uis(ui)
  local uis = {}
  uis.LineList = ui:GetChild("LineList")
  uis.LineTab = GetChat_LineTabUis(ui:GetChild("LineTab"))
  uis.root = ui
  return uis
end
