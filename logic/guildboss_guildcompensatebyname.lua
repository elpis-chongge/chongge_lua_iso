require("CommonResource_PopupBgByName")
require("GuildBoss_CompensateTipsByName")

function GetGuildBoss_GuildCompensateUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetGuildBoss_CompensateTipsUis(ui:GetChild("Tips"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
