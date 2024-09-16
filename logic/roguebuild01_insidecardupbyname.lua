require("CommonResource_BackGroundByName")
require("RogueBuild01_CardUp_InfoByName")
require("RogueBuild01_ChoiceCardList_InfoByName")
require("RogueBuild01_CardUp_Info4NumberByName")
require("RogueBuild01_ChoiceCardList_OccupationByName")

function GetRogueBuild01_InsideCardUpUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Info1 = GetRogueBuild01_CardUp_InfoUis(ui:GetChild("Info1"))
  uis.Info2 = GetRogueBuild01_ChoiceCardList_InfoUis(ui:GetChild("Info2"))
  uis.ChoiceNumber = GetRogueBuild01_CardUp_Info4NumberUis(ui:GetChild("ChoiceNumber"))
  uis.AssetsList = ui:GetChild("AssetsList")
  uis.TeamList = ui:GetChild("TeamList")
  uis.Occupation = GetRogueBuild01_ChoiceCardList_OccupationUis(ui:GetChild("Occupation"))
  uis.SwitchBtn = ui:GetChild("SwitchBtn")
  uis.ReviveBtn = ui:GetChild("ReviveBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
