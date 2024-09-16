require("PlayerInfo_PlayerByName")

function GetPlayerInfo_PlayerWindowUis(ui)
  local uis = {}
  uis.Main = GetPlayerInfo_PlayerUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
