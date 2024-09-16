require("Message_BadgeInfoTipsByName")

function GetMessage_BadgeInfoTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_BadgeInfoTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
