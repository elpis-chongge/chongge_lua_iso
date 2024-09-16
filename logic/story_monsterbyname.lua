require("Story_MonsterInfoByName")
require("CommonResource_ListRedDotByName")
require("CommonResource_ListRedDot1ByName")

function GetStory_MonsterUis(ui)
  local uis = {}
  uis.MonsterList = ui:GetChild("MonsterList")
  uis.MonsterInfo = GetStory_MonsterInfoUis(ui:GetChild("MonsterInfo"))
  uis.ListRedDot = GetCommonResource_ListRedDotUis(ui:GetChild("ListRedDot"))
  uis.ListRedDot1 = GetCommonResource_ListRedDot1Uis(ui:GetChild("ListRedDot1"))
  uis.c1Ctr = ui:GetController("c1")
  uis.ListCtr = ui:GetController("List")
  uis.ListLeftCtr = ui:GetController("ListLeft")
  uis.root = ui
  return uis
end
