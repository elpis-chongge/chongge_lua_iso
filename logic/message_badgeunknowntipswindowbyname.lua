require("Message_BadgeUnknownTipsByName")

function GetMessage_BadgeUnknownTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_BadgeUnknownTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
