require("RaidBoss_GiveUpByName")

function GetRaidBoss_GiveUpWindowUis(ui)
  local uis = {}
  uis.Main = GetRaidBoss_GiveUpUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
