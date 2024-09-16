require("RaidBossTips_RageSkillByName")

function GetRaidBossTips_RageSkillWindowUis(ui)
  local uis = {}
  uis.Main = GetRaidBossTips_RageSkillUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
