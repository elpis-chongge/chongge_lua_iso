require("CommonResource_PopupBgByName")
require("GuildBoss_RecommendNothingByName")

function GetGuildBoss_RecommendUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.ScreenBtn = ui:GetChild("ScreenBtn")
  uis.Nothing = GetGuildBoss_RecommendNothingUis(ui:GetChild("Nothing"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
