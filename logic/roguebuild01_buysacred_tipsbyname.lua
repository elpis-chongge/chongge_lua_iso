require("RogueBuild01_BookSacredHeadByName")
require("RogueBuild01_BuySacred_ConditionByName")

function GetRogueBuild01_BuySacred_TipsUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Head = GetRogueBuild01_BookSacredHeadUis(ui:GetChild("Head"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Condition = GetRogueBuild01_BuySacred_ConditionUis(ui:GetChild("Condition"))
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.root = ui
  return uis
end
