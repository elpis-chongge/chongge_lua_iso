require("CommonResource_BackGroundByName")
require("ActivityDungeon1001_MainTitleByName")
require("CommonResource_CurrencyReturnByName")

function GetActivityDungeon1001_ActivityDungeonUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MainTitle = GetActivityDungeon1001_MainTitleUis(ui:GetChild("MainTitle"))
  uis.PlotBtn = ui:GetChild("PlotBtn")
  uis.TaskBtn = ui:GetChild("TaskBtn")
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.NormalBtn = ui:GetChild("NormalBtn")
  uis.MaterialBtn = ui:GetChild("MaterialBtn")
  uis.BossBtn = ui:GetChild("BossBtn")
  uis.MiniGameBtn = ui:GetChild("MiniGameBtn")
  uis.SignBtn = ui:GetChild("SignBtn")
  uis.PassBtn = ui:GetChild("PassBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
