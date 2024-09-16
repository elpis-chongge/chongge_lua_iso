require("CommonResource_PopupBgByName")
require("Message_GiftTips1ByName")
require("Message_GiftTips2ByName")
require("Message_AssetsTipsGroupByName")

function GetMessage_GiftTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.GiftTips1 = GetMessage_GiftTips1Uis(ui:GetChild("GiftTips1"))
  uis.GiftTips2 = GetMessage_GiftTips2Uis(ui:GetChild("GiftTips2"))
  uis.AssetsTipsGroup = GetMessage_AssetsTipsGroupUis(ui:GetChild("AssetsTipsGroup"))
  uis.root = ui
  return uis
end
