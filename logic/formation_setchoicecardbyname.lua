require("Formation_SetChoiceCardBgByName")
require("CommonResource_OccupationByName")

function GetFormation_SetChoiceCardUis(ui)
  local uis = {}
  uis.PicMask = GetFormation_SetChoiceCardBgUis(ui:GetChild("PicMask"))
  uis.Occupation = GetCommonResource_OccupationUis(ui:GetChild("Occupation"))
  uis.ElementList = ui:GetChild("ElementList")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
