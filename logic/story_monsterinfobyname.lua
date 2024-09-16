require("Story_Tab2RegionByName")
require("Story_MonsterTitleByName")
require("Story_MonsterInfoWordByName")

function GetStory_MonsterInfoUis(ui)
  local uis = {}
  uis.Tab2Region = GetStory_Tab2RegionUis(ui:GetChild("Tab2Region"))
  uis.MonsterTitle = GetStory_MonsterTitleUis(ui:GetChild("MonsterTitle"))
  uis.HeadList = ui:GetChild("HeadList")
  uis.MonsterInfoWord = GetStory_MonsterInfoWordUis(ui:GetChild("MonsterInfoWord"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
