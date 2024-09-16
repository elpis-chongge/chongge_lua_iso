require("RogueBuild01_ItemLook_SacredStateByName")
require("RogueBuild01_BookSacredHeadByName")
require("RogueBuild01_ItemLook_SacredConditionByName")

function GetRogueBuild01_ItemLook_SacredItemUis(ui)
  local uis = {}
  uis.State = GetRogueBuild01_ItemLook_SacredStateUis(ui:GetChild("State"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Head = GetRogueBuild01_BookSacredHeadUis(ui:GetChild("Head"))
  uis.Condition = GetRogueBuild01_ItemLook_SacredConditionUis(ui:GetChild("Condition"))
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
