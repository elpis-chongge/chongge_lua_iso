require("Message_DispatchRewardTitleByName")

function GetMessage_DispatchReward1Uis(ui)
  local uis = {}
  uis.DispatchRewardTitle = GetMessage_DispatchRewardTitleUis(ui:GetChild("DispatchRewardTitle"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.Word1Txt = ui:GetChild("Word1Txt")
  uis.root = ui
  return uis
end
