require("CommonResource_OccupationByName")

function GetMessage_CardAttributeUis(ui)
  local uis = {}
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.StarList = ui:GetChild("StarList")
  uis.root = ui
  return uis
end
