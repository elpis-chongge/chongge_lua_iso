require("CommonResource_BackGroundByName")
require("RogueBuild01_InsideMapBottomByName")
require("RogueBuild01_Camp_EventNumberByName")

function GetRogueBuild01_InsideCampUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OutBtn = ui:GetChild("OutBtn")
  uis.Botton = GetRogueBuild01_InsideMapBottomUis(ui:GetChild("Botton"))
  uis.EventList = ui:GetChild("EventList")
  uis.Number = GetRogueBuild01_Camp_EventNumberUis(ui:GetChild("Number"))
  uis.AssetsList = ui:GetChild("AssetsList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
