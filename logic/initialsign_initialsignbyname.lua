require("CommonResource_BackGroundByName")
require("InitialSign_SignTipsByName")

function GetInitialSign_InitialSignUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.SignTips = GetInitialSign_SignTipsUis(ui:GetChild("SignTips"))
  uis.RewardShowBtn = ui:GetChild("RewardShowBtn")
  uis.root = ui
  return uis
end
