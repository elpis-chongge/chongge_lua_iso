require("Passport_LevelByName")

function GetPassport_LevelRegionUis(ui)
  local uis = {}
  uis.LevelBtn = GetPassport_LevelUis(ui:GetChild("LevelBtn"))
  uis.root = ui
  return uis
end
