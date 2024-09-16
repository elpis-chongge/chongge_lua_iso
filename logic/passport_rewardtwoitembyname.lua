require("Passport_AllFrame_MByName")

function GetPassport_RewardTwoItemUis(ui)
  local uis = {}
  uis.Item = GetPassport_AllFrame_MUis(ui:GetChild("Item"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
