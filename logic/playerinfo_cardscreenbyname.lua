require("PlayerInfo_GatherChoiceByName")

function GetPlayerInfo_CardScreenUis(ui)
  local uis = {}
  uis.PopupCloseBtn = ui:GetChild("PopupCloseBtn")
  uis.GatherChoice = GetPlayerInfo_GatherChoiceUis(ui:GetChild("GatherChoice"))
  uis.root = ui
  return uis
end
