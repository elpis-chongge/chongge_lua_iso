require("Card_AttributeDes2ByName")

function GetCard_AttributeDesWindowUis(ui)
  local uis = {}
  uis.Main = GetCard_AttributeDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
