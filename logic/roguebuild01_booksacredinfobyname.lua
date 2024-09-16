require("RogueBuild01_BookSacredConditionInfoByName")
require("RogueBuild01_BookSacredHeadByName")
require("RogueBuild01_BookSacredConditionByName")

function GetRogueBuild01_BookSacredInfoUis(ui)
  local uis = {}
  uis.ConditionInfo = GetRogueBuild01_BookSacredConditionInfoUis(ui:GetChild("ConditionInfo"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Head = GetRogueBuild01_BookSacredHeadUis(ui:GetChild("Head"))
  uis.Condition = GetRogueBuild01_BookSacredConditionUis(ui:GetChild("Condition"))
  uis.IDTxt = ui:GetChild("IDTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.LockBtn = ui:GetChild("LockBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
