require("CommonResource_PopupBgByName")
require("Message_TokensTipsByName")
require("Message_AssetsTipsGroupByName")

function GetMessage_TokensTipsAniUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.TokensTips = GetMessage_TokensTipsUis(ui:GetChild("TokensTips"))
  uis.AssetsTipsGroup = GetMessage_AssetsTipsGroupUis(ui:GetChild("AssetsTipsGroup"))
  uis.root = ui
  return uis
end
