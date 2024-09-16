require("Passport_ItemFrame_EByName")
require("Passport_CardFrame_EByName")

function GetPassport_AllFrame_EUis(ui)
  local uis = {}
  uis.ItemFrame = GetPassport_ItemFrame_EUis(ui:GetChild("ItemFrame"))
  uis.CardFrame = GetPassport_CardFrame_EUis(ui:GetChild("CardFrame"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
