require("GuildTrain_FormationGridCenterByName")
require("GuildTrain_FormationGridEdgeByName")
require("GuildTrain_FormationGridEdgeVerByName")

function GetGuildTrain_FormationGridLineUis(ui)
  local uis = {}
  uis.Center = GetGuildTrain_FormationGridCenterUis(ui:GetChild("Center"))
  uis.Top = GetGuildTrain_FormationGridEdgeUis(ui:GetChild("Top"))
  uis.Down = GetGuildTrain_FormationGridEdgeUis(ui:GetChild("Down"))
  uis.Left = GetGuildTrain_FormationGridEdgeVerUis(ui:GetChild("Left"))
  uis.Right = GetGuildTrain_FormationGridEdgeVerUis(ui:GetChild("Right"))
  uis.root = ui
  return uis
end
