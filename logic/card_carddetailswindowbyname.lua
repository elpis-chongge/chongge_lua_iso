require("Card_CardDetailsByName")

function GetCard_CardDetailsWindowUis(ui)
  local uis = {}
  uis.Main = GetCard_CardDetailsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
