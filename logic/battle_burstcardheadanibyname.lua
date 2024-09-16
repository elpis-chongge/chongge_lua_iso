require("Battle_BurstCardHeadByName")

function GetBattle_BurstCardHeadAniUis(ui)
  local uis = {}
  uis.BurstCardHead = GetBattle_BurstCardHeadUis(ui:GetChild("BurstCardHead"))
  uis.root = ui
  return uis
end
