require("CommonResource_PopupBgByName")
require("RaidBoss_GiveUpContentByName")

function GetRaidBoss_GiveUpUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.GiveUpContent = GetRaidBoss_GiveUpContentUis(ui:GetChild("GiveUpContent"))
  uis.root = ui
  return uis
end
