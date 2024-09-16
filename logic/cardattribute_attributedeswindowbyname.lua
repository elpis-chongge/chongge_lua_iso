require("CardAttribute_AttributeDes2ByName")

function GetCardAttribute_AttributeDesWindowUis(ui)
  local uis = {}
  uis.Main = GetCardAttribute_AttributeDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
