require("Message_GiftLimitationNumberByName")

function GetMessage_GiftWordContentUis(ui)
  local uis = {}
  uis.WordList = ui:GetChild("WordList")
  uis.GiftLimitationNumber = GetMessage_GiftLimitationNumberUis(ui:GetChild("GiftLimitationNumber"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
