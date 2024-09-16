require("Formation_FormationGridCenterByName")
require("Formation_FormationGridEdgeByName")
require("Formation_FormationGridEdgeVerByName")

function GetFormation_FormationGridLineUis(ui)
  local uis = {}
  uis.Center = GetFormation_FormationGridCenterUis(ui:GetChild("Center"))
  uis.Top = GetFormation_FormationGridEdgeUis(ui:GetChild("Top"))
  uis.Down = GetFormation_FormationGridEdgeUis(ui:GetChild("Down"))
  uis.Left = GetFormation_FormationGridEdgeVerUis(ui:GetChild("Left"))
  uis.Right = GetFormation_FormationGridEdgeVerUis(ui:GetChild("Right"))
  uis.root = ui
  return uis
end
