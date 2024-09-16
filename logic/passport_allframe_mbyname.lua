require("Passport_ItemFrame_MByName")
require("Passport_CardFrame_MByName")

function GetPassport_AllFrame_MUis(ui)
  local uis = {}
  uis.ItemFrame = GetPassport_ItemFrame_MUis(ui:GetChild("ItemFrame"))
  uis.CardFrame = GetPassport_CardFrame_MUis(ui:GetChild("CardFrame"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
