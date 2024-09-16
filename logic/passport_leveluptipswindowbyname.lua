require("Passport_LevelUpTipsByName")

function GetPassport_LevelUpTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetPassport_LevelUpTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
