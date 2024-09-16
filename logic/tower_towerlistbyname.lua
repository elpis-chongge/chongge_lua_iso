require("CommonResource_BackGroundByName")
require("CommonResource_CurrencyReturnByName")

function GetTower_TowerListUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.TipsList = ui:GetChild("TipsList")
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
