require("Battle_BlockHitNumberByName")

function GetBattle_BlockHitNumberTipsUis(ui)
  local uis = {}
  uis.BlockHitNumber = GetBattle_BlockHitNumberUis(ui:GetChild("BlockHitNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
