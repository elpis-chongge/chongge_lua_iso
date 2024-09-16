require("CommonResource_OccupationByName")

function GetGuildTrain_CardInfoLeftUis(ui)
  local uis = {}
  uis.CardHolder = ui:GetChild("CardHolder")
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.root = ui
  return uis
end
