require("CommonResource_BackGroundByName")
require("RogueBuild01_ChoiceCardList_InfoByName")
require("RogueBuild01_ChoiceCardList_Info5ByName")
require("RogueBuild01_ChoiceCardList_OccupationByName")

function GetRogueBuild01_StartChoiceCardListUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Info = GetRogueBuild01_ChoiceCardList_InfoUis(ui:GetChild("Info"))
  uis.ChoiceNumber = GetRogueBuild01_ChoiceCardList_Info5Uis(ui:GetChild("ChoiceNumber"))
  uis.TeamList = ui:GetChild("TeamList")
  uis.Occupation = GetRogueBuild01_ChoiceCardList_OccupationUis(ui:GetChild("Occupation"))
  uis.AssetsList = ui:GetChild("AssetsList")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.RecruitBtn = ui:GetChild("RecruitBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
