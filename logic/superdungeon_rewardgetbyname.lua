require("CommonResource_BackGroundByName")
require("SuperDungeon_RewardSpecialItemByName")
require("CommonResource_CurrencyReturnByName")

function GetSuperDungeon_RewardGetUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TabList = ui:GetChild("TabList")
  uis.ItemList = ui:GetChild("ItemList")
  uis.SpecialItem = GetSuperDungeon_RewardSpecialItemUis(ui:GetChild("SpecialItem"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
