require("Card_CardListByName")

function GetCard_CardListWindowUis(ui)
  local uis = {}
  uis.Main = GetCard_CardListUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
