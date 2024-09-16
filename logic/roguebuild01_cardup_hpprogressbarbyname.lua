require("RogueBuild01_CardUp_HpProgressFillByName")

function GetRogueBuild01_CardUp_HpProgressBarUis(ui)
  local uis = {}
  uis.bar = GetRogueBuild01_CardUp_HpProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
