require("Message_MainModularByName")
require("Message_DetailsModularByName")
require("Message_NumberModularByName")
require("Message_CardChangeModularByName")
require("Message_CardDetailsModularByName")
require("Message_ClothesChangeModularByName")
require("Message_ClothesDetailsModularByName")
require("Message_BreachGiftModularByName")
require("Message_PassportModularByName")

function GetMessage_ItemTipsUis(ui)
  local uis = {}
  uis.MainModular = GetMessage_MainModularUis(ui:GetChild("MainModular"))
  uis.DetailsModular = GetMessage_DetailsModularUis(ui:GetChild("DetailsModular"))
  uis.NumberModular = GetMessage_NumberModularUis(ui:GetChild("NumberModular"))
  uis.CardChangeModular = GetMessage_CardChangeModularUis(ui:GetChild("CardChangeModular"))
  uis.CardDetailsModular = GetMessage_CardDetailsModularUis(ui:GetChild("CardDetailsModular"))
  uis.ClothesChangeModular = GetMessage_ClothesChangeModularUis(ui:GetChild("ClothesChangeModular"))
  uis.ClothesDetailsModular = GetMessage_ClothesDetailsModularUis(ui:GetChild("ClothesDetailsModular"))
  uis.BreachGiftModular = GetMessage_BreachGiftModularUis(ui:GetChild("BreachGiftModular"))
  uis.PassportModular = GetMessage_PassportModularUis(ui:GetChild("PassportModular"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
