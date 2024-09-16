require("Land_PopupBgByName")
require("Land_AgreementByName")
require("Land_NoticeByName")
require("Land_RepairByName")
require("Land_AgeTipsByName")
require("Land_MaintenanceByName")

function GetLand_PopupUis(ui)
  local uis = {}
  uis.PopupBgLand = GetLand_PopupBgUis(ui:GetChild("PopupBgLand"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.Agreement = GetLand_AgreementUis(ui:GetChild("Agreement"))
  uis.popup = GetLand_NoticeUis(ui:GetChild("popup"))
  uis.Repair = GetLand_RepairUis(ui:GetChild("Repair"))
  uis.AgeTips = GetLand_AgeTipsUis(ui:GetChild("AgeTips"))
  uis.Maintenance = GetLand_MaintenanceUis(ui:GetChild("Maintenance"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
