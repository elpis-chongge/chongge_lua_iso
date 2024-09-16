require("Battle_BurstCardHeadAniByName")

function GetBattle_BurstCardHeadAni1Uis(ui)
  local uis = {}
  uis.BurstCardHead = GetBattle_BurstCardHeadAniUis(ui:GetChild("BurstCardHead"))
  uis.root = ui
  return uis
end
