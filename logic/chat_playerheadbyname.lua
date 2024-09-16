require("Chat_PlayerHeadBgByName")

function GetChat_PlayerHeadUis(ui)
  local uis = {}
  uis.PlayerHeadBg = GetChat_PlayerHeadBgUis(ui:GetChild("PlayerHeadBg"))
  uis.root = ui
  return uis
end
