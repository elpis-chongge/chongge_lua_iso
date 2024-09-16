require("CommonResource_PopupBgByName")
require("GuildBoss_ScreenTipsByName")

function GetGuildBoss_RecommendScreenUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetGuildBoss_ScreenTipsUis(ui:GetChild("Tips"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
