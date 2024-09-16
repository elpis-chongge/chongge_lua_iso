require("Message_DispatchReward2ByName")

function GetMessage_DispatchRewardShowWindowUis(ui)
  local uis = {}
  uis.Main = GetMessage_DispatchReward2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
