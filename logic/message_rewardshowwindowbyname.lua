require("Message_RewardShow2ByName")

function GetMessage_RewardShowWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_RewardShow2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
