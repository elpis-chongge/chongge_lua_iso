require("Badge_LockByName")

function GetBadge_DetailsInfo1Uis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.PartsTxt = ui:GetChild("PartsTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.Lock = GetBadge_LockUis(ui:GetChild("Lock"))
  uis.root = ui
  return uis
end
