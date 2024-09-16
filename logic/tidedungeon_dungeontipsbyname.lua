require("CommonResource_PopupBgByName")
require("TideDungeon_ExplainTipsByName")

function GetTideDungeon_DungeonTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.ExplainTips = GetTideDungeon_ExplainTipsUis(ui:GetChild("ExplainTips"))
  uis.root = ui
  return uis
end
