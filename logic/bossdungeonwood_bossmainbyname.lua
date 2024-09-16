require("CommonResource_BackGroundByName")
require("CommonResource_CurrencyReturnByName")

function GetBossDungeonWood_BossMainUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Enter1Btn = ui:GetChild("Enter1Btn")
  uis.Enter2Btn = ui:GetChild("Enter2Btn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
