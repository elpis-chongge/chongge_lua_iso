require("Chat_ChatByName")

function GetChat_ChatWindowUis(ui)
  local uis = {}
  uis.Main = GetChat_ChatUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
