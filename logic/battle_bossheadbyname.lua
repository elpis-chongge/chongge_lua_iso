require("Battle_BossHeadBgByName")

function GetBattle_BossHeadUis(ui)
  local uis = {}
  uis.BossHeadBg = GetBattle_BossHeadBgUis(ui:GetChild("BossHeadBg"))
  uis.root = ui
  return uis
end
