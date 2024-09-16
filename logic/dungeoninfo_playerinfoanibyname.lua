require("DungeonInfo_PlayerInfoByName")

function GetDungeonInfo_PlayerInfoAniUis(ui)
  local uis = {}
  uis.PlayerInfo = GetDungeonInfo_PlayerInfoUis(ui:GetChild("PlayerInfo"))
  uis.root = ui
  return uis
end
