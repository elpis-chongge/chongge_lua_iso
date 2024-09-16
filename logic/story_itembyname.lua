require("Story_MonsterTitleByName")
require("Story_ItemInfoByName")

function GetStory_ItemUis(ui)
  local uis = {}
  uis.MonsterTitle = GetStory_MonsterTitleUis(ui:GetChild("MonsterTitle"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.ItemInfo = GetStory_ItemInfoUis(ui:GetChild("ItemInfo"))
  uis.root = ui
  return uis
end
