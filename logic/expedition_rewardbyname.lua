require("CommonResource_BackGroundByName")
require("Expedition_RewardTitleByName")
require("Expedition_RewardStarNumberByName")
require("CommonResource_CurrencyReturnByName")

function GetExpedition_RewardUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.RewardTitle = GetExpedition_RewardTitleUis(ui:GetChild("RewardTitle"))
  uis.RewardList = ui:GetChild("RewardList")
  uis.RewardStarNumber = GetExpedition_RewardStarNumberUis(ui:GetChild("RewardStarNumber"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
