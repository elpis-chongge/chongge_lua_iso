require("Battle_HangUpByName")

function GetBattle_HangUpWindowUis(ui)
  local uis = {}
  uis.HangUp = GetBattle_HangUpUis(ui:GetChild("HangUp"))
  uis.root = ui
  return uis
end
