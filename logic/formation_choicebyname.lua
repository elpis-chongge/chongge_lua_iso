require("Formation_LabeRegionByName")
require("Formation_ExtendLockByName")

function GetFormation_ChoiceUis(ui)
  local uis = {}
  uis.TipsList = ui:GetChild("TipsList")
  uis.LabeRegion = GetFormation_LabeRegionUis(ui:GetChild("LabeRegion"))
  uis.CardList = ui:GetChild("CardList")
  uis.ScreenBtn = ui:GetChild("ScreenBtn")
  uis.CardDownBtn = ui:GetChild("CardDownBtn")
  uis.CardUpBtn = ui:GetChild("CardUpBtn")
  uis.ExtendLock1 = GetFormation_ExtendLockUis(ui:GetChild("ExtendLock1"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.c4Ctr = ui:GetController("c4")
  uis.GuildBossCtr = ui:GetController("GuildBoss")
  uis.root = ui
  return uis
end
