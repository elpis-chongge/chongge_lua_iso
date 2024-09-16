require("Battle_BurstBlockHitNumberByName")

function GetBattle_BurstBlockHitNumberTipsUis(ui)
  local uis = {}
  uis.BlockHitNumber = GetBattle_BurstBlockHitNumberUis(ui:GetChild("BlockHitNumber"))
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
