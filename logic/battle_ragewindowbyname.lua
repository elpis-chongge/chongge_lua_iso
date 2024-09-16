require("Battle_RageByName")

function GetBattle_RageWindowUis(ui)
  local uis = {}
  uis.Main = GetBattle_RageUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
