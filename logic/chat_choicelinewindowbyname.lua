require("Chat_ChoiceLine2ByName")

function GetChat_ChoiceLineWindowUis(ui)
  local uis = {}
  uis.Main = GetChat_ChoiceLine2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
