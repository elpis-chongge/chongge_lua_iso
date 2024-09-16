require("Card_GatherChoiceByName")

function GetCard_CardScreenUis(ui)
  local uis = {}
  uis.PopupCloseBtn = ui:GetChild("PopupCloseBtn")
  uis.GatherChoice = GetCard_GatherChoiceUis(ui:GetChild("GatherChoice"))
  uis.root = ui
  return uis
end
