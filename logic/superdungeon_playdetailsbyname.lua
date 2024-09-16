require("CommonResource_PopupBgByName")
require("SuperDungeon_PlayTipsByName")

function GetSuperDungeon_PlayDetailsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.PlayTips = GetSuperDungeon_PlayTipsUis(ui:GetChild("PlayTips"))
  uis.root = ui
  return uis
end
