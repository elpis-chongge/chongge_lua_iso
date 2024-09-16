require("Chat_PlayerListByName")

function GetChat_PlayerListAniUis(ui)
  local uis = {}
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PlayerList = GetChat_PlayerListUis(ui:GetChild("PlayerList"))
  uis.root = ui
  return uis
end
