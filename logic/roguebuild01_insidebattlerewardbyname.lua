require("CommonResource_BackGroundByName")
require("RogueBuild01_InsideMapBottomByName")

function GetRogueBuild01_InsideBattleRewardUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OutBtn = ui:GetChild("OutBtn")
  uis.Botton = GetRogueBuild01_InsideMapBottomUis(ui:GetChild("Botton"))
  uis.AssetsList = ui:GetChild("AssetsList")
  uis.EventList = ui:GetChild("EventList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
