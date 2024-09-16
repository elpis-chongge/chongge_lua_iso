require("CommonResource_PopupBgByName")
require("Lottery_AssetsTipsGroupByName")
require("Abyss_RandomTipsByName")

function GetAbyss_RandomTipsWindowUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.AssetsTipsGroup = GetLottery_AssetsTipsGroupUis(ui:GetChild("AssetsTipsGroup"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.Main = GetAbyss_RandomTipsUis(ui:GetChild("Main"))
  uis.SkipBtn = ui:GetChild("SkipBtn")
  uis.root = ui
  return uis
end
