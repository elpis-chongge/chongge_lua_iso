require("CommonResource_PopupBgByName")
require("BossDungeon_TipsBgByName")
require("BossDungeon_TipsNumberByName")

function GetBossDungeon_BossOpenTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.TipsBg = GetBossDungeon_TipsBgUis(ui:GetChild("TipsBg"))
  uis.TipsNumber = GetBossDungeon_TipsNumberUis(ui:GetChild("TipsNumber"))
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.root = ui
  return uis
end
