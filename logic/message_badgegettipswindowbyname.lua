require("Message_BadgeGetTipsByName")

function GetMessage_BadgeGetTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_BadgeGetTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
