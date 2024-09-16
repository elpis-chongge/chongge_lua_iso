require("Battle_Card10080ByName")

function GetBattle_CardSignUis(ui)
  local uis = {}
  uis.Card10080 = GetBattle_Card10080Uis(ui:GetChild("Card10080"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
