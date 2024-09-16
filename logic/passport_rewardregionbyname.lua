require("Passport_MiddleRegionByName")
require("Passport_StartTwoByName")
require("Passport_EndTwoByName")

function GetPassport_RewardRegionUis(ui)
  local uis = {}
  uis.MiddleList = GetPassport_MiddleRegionUis(ui:GetChild("MiddleList"))
  uis.StartTwo = GetPassport_StartTwoUis(ui:GetChild("StartTwo"))
  uis.EndTwo = GetPassport_EndTwoUis(ui:GetChild("EndTwo"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
