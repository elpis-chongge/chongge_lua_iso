require("Abyss_MobByName")

function GetAbyss_MobWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_MobUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
