require("Message_BadgeDetailsInfo1_1ByName")

function GetMessage_BadgeDetailsInfo1Uis(ui)
  local uis = {}
  uis.BadgeDetailsInfo1_1 = GetMessage_BadgeDetailsInfo1_1Uis(ui:GetChild("BadgeDetailsInfo1_1"))
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.root = ui
  return uis
end
