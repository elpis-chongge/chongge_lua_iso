require("CommonResource_PopupBgByName")
require("Lottery_AssetsTipsGroupByName")
require("Abyss_MoveEventTipsByName")

function GetAbyss_MoveEventTipsWindowUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.AssetsTipsGroup = GetLottery_AssetsTipsGroupUis(ui:GetChild("AssetsTipsGroup"))
  uis.Main = GetAbyss_MoveEventTipsUis(ui:GetChild("Main"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.SkipBtn = ui:GetChild("SkipBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
