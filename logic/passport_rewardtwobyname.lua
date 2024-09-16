require("Passport_RewardTwoItemByName")
require("Passport_LevelTitleByName")

function GetPassport_RewardTwoUis(ui)
  local uis = {}
  uis.Reward1 = GetPassport_RewardTwoItemUis(ui:GetChild("Reward1"))
  uis.Reward2 = GetPassport_RewardTwoItemUis(ui:GetChild("Reward2"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.Title = GetPassport_LevelTitleUis(ui:GetChild("Title"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
