require("Message_GiftTipsByName")

function GetMessage_GiftTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_GiftTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
