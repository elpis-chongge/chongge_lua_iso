require("Message_BadgeStarPicByName")

function GetMessage_BadgeStarUis(ui)
  local uis = {}
  uis.BadgeStar1 = GetMessage_BadgeStarPicUis(ui:GetChild("BadgeStar1"))
  uis.BadgeStar2 = GetMessage_BadgeStarPicUis(ui:GetChild("BadgeStar2"))
  uis.root = ui
  return uis
end
