require("ActivityDungeon1002_MiniStart_MidLatticeByName")

function GetActivityDungeon1002_MiniStart_MidLatticeAniUis(ui)
  local uis = {}
  uis.Lattice = GetActivityDungeon1002_MiniStart_MidLatticeUis(ui:GetChild("Lattice"))
  uis.root = ui
  return uis
end
