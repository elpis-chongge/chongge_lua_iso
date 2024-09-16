require("Message_SweepCardBgByName")
require("Message_SweepCardItemByName")

function GetMessage_SweepCardUis(ui)
  local uis = {}
  uis.SweepCardBg = GetMessage_SweepCardBgUis(ui:GetChild("SweepCardBg"))
  uis.SweepCardItem = GetMessage_SweepCardItemUis(ui:GetChild("SweepCardItem"))
  uis.root = ui
  return uis
end
