require("Formation_GuildBossHPHeadBgByName")

function GetFormation_GuildBossHPHeadUis(ui)
  local uis = {}
  uis.Pic = GetFormation_GuildBossHPHeadBgUis(ui:GetChild("Pic"))
  uis.root = ui
  return uis
end
