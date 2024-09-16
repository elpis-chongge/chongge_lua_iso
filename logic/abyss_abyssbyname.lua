require("CommonResource_BackGroundByName")
require("Abyss_PlayerInfoByName")
require("Abyss_SmallMapRegionByName")

function GetAbyss_AbyssUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.PlayerInfo = GetAbyss_PlayerInfoUis(ui:GetChild("PlayerInfo"))
  uis.ExplainBtn = ui:GetChild("ExplainBtn")
  uis.CardSwitchBtn = ui:GetChild("CardSwitchBtn")
  uis.FunctionOpenBtn = ui:GetChild("FunctionOpenBtn")
  uis.AbyssNewPeopleBtn = ui:GetChild("AbyssNewPeopleBtn")
  uis.TaskList = ui:GetChild("TaskList")
  uis.SmallMapRegion = GetAbyss_SmallMapRegionUis(ui:GetChild("SmallMapRegion"))
  uis.MemberBtn = ui:GetChild("MemberBtn")
  uis.BadgeBtn = ui:GetChild("BadgeBtn")
  uis.DailyTaskBtn = ui:GetChild("DailyTaskBtn")
  uis.StoryBtn = ui:GetChild("StoryBtn")
  uis.RightRegionList = ui:GetChild("RightRegionList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.PositionBtn = ui:GetChild("PositionBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.newpeopleCtr = ui:GetController("newpeople")
  uis.root = ui
  return uis
end
