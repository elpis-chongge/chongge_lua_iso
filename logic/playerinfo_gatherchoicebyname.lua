require("PlayerInfo_OccupationChoiceByName")
require("PlayerInfo_ElementChoiceByName")

function GetPlayerInfo_GatherChoiceUis(ui)
  local uis = {}
  uis.OccupationChoice = GetPlayerInfo_OccupationChoiceUis(ui:GetChild("OccupationChoice"))
  uis.ElementChoice = GetPlayerInfo_ElementChoiceUis(ui:GetChild("ElementChoice"))
  uis.root = ui
  return uis
end
