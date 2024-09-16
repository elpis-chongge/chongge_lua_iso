require("CommonResource_PopupBgByName")
require("Formation_BattlePlayerNumberRegionByName")
require("Formation_BattlePlayerNumberWordByName")

function GetFormation_BattlePlayerNumberUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.Region = GetFormation_BattlePlayerNumberRegionUis(ui:GetChild("Region"))
  uis.Word = GetFormation_BattlePlayerNumberWordUis(ui:GetChild("Word"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
